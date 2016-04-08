#ifndef HOWLER_MONKEY__
#define HOWLER_MONKEY__

#include <vector>
#include <string>

typedef struct Interaction_ {
    int reflections;
    float dist;
} interaction;

void create_impulse(std::vector<interaction> interactions, std::string fileName);

#endif
