#ifndef HOWLER_MONKEY__
#define HOWLER_MONKEY__

#include <vector>

typedef struct Interaction_ {
    int reflections;
    float dist;
} interaction;

void create_impulse(const std::vector<interaction> &interactions, char fileName[]);

#endif
