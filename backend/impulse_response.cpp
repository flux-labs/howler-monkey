#include "../dist/include/aquila/aquila.h"
#include <stdlib.h>
#include <time.h>
#define SAMPLES_PER_SECOND 44100

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

void apply_echo(double * res, const double * impulse, size_t i, int delay_samples, double delay_factor) {
    int delay = delay_samples;
    double this_delay_factor = delay_factor;
    while ((int)(i - delay) > 0) {;
        double moment = (impulse[i - delay] / 2 + res[i - delay] / 2) / this_delay_factor;
        res[i] += moment;
        int inner = -500;
        while (inner++ < 500) {
            int r = rand() % 100;
            double factor = (double)(inner == 0 ? 1 : inner);
            factor = factor < 0 ? -factor : factor;
            if (r > 66 && i + inner < SIZE) {
                res[i + inner] += moment / factor;
            }
            else if (r < 33 && i - inner > 0) {
                res[i - inner] += moment / factor;
            }
        }
        delay += delay_samples;
        this_delay_factor += delay_factor;
    }
}


int main(int argc, char * argv[])
{
    const double * impulse = create_impulse();
    double res[SIZE] = {0};

    std::shared_ptr<Aquila::Fft> fft = Aquila::FftFactory::getFft(SIZE);

    Aquila::SpectrumType spectrum = fft->fft(impulse);

    srand(time(NULL));

    for (int i = 0; i < SIZE; i++) {
        res[i] += impulse[i];
        apply_echo(res, impulse, i, SAMPLES_PER_SECOND, 100);
    }

    Aquila::SignalSource withEchos(res, SIZE, SAMPLES_PER_SECOND);

    Aquila::WaveFileHandler wav(argv[1]);

    wav.save(withEchos);

    return 0;
}

