#include "../dist/include/aquila/aquila.h"
#include "howler-monkey.h"
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <vector>
#include <string>
#include <algorithm>
#include <functional>
#define SAMPLES_PER_SECOND 44100
#define SPEED_OF_SOUND 340.29

const int SECONDS_OF_IR = 6;
const size_t SIZE = SAMPLES_PER_SECOND * SECONDS_OF_IR;
const int MAX = 1020;
const int HALF_MAX = MAX / 2;

const double * create_impulse()
{
    double envelope[SIZE] = {0};

    for (int i = 0; i < MAX; i++) {
        if (i <= HALF_MAX) envelope[i] = i * 50;
        else envelope[i] = (HALF_MAX - i) * 50;
    }

    Aquila::WhiteNoiseGenerator generator(SAMPLES_PER_SECOND);
    generator.setAmplitude(2).generate(SIZE);

    Aquila::SignalSource env(envelope, SIZE, SAMPLES_PER_SECOND);

    generator *= env;

    return generator.toArray();
}

void apply_reverb(
        double * res,
        const Aquila::SpectrumType & impulseSpectrum,
        std::vector<interaction>::const_iterator it,
        std::shared_ptr<Aquila::Fft> fft
)
{
    int travel_time_in_samples = (int)((float)(it->dist / SPEED_OF_SOUND) * SAMPLES_PER_SECOND);
    if (travel_time_in_samples > SIZE) {
        return;
    }

    Aquila::SpectrumType filterSpectrum(SIZE);

    for (std::size_t i = 0; i < SIZE; i++) {
        float l = log(i + (SIZE / 10) * it->reflections);
        filterSpectrum[i] = l < 0 ? 0 : l;
    }

    Aquila::SpectrumType resultSpectrum(SIZE);

    std::transform(
        std::begin(impulseSpectrum),
        std::end(impulseSpectrum),
        std::begin(filterSpectrum),
        std::begin(resultSpectrum),
        [] (Aquila::ComplexType x, Aquila::ComplexType y) { return x * y; }
    );

    double x1[SIZE];
    fft->ifft(resultSpectrum, x1);

    for (int i = 0; i + travel_time_in_samples < SIZE; i++) {
        res[i + travel_time_in_samples] += x1[i];
    }
}


void create_impulse(const std::vector<interaction> interactions, std::string fileName)
{

    const double * impulse = create_impulse();
    double res[SIZE] = {0};

    auto fft = Aquila::FftFactory::getFft(SIZE);
    Aquila::SpectrumType impulseSpectrum = fft->fft(impulse);

    for (std::vector<interaction>::const_iterator i = interactions.begin(); i != interactions.end(); ++i) {
        apply_reverb(res, impulseSpectrum, i, fft);
    }

    Aquila::SignalSource with_reverb(res, SIZE, SAMPLES_PER_SECOND);

    Aquila::WaveFileHandler wav(fileName);

    wav.save(with_reverb);
}

