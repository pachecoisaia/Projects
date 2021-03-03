#include <stdlib.h>
#include <stdio.h>

float calcTime(float vol);

int main(int argc, char* argv[]) {
    printf("Program #1b, cssc0508, Isaia Pacheco\n\n");

    if(argc != 4) {
        printf("Usage: p1b length width height\n");
        exit(1);
    }

    float length = atof(argv[1]);
    float width = atof(argv[2]);
    float height = atof(argv[3]);

    float dimensions = length * width * height;
    float volume = dimensions * 7.8;

    float time = calcTime(volume);

    printf("Time to fill swimming pool a %f by %f by %f with water input rate of 20.0 gallons per minute is %f minutes.\n", length, width, height, time);
    return 0;
}

float calcTime(float vol) {
    float rate = 20;
    return vol / rate;
}
