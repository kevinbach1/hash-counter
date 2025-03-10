#define _GNU_SOURCE

#include <stdio.h>
#include "mythreads.h"
#include <stdlib.h>
#include <pthread.h>
#include <dirent.h>

int main(int argc, char *argv[]) {
    if (argc != 6) {
        fprintf(stderr, "usage: %s <N> <K> <directory> <output_file> <value>\n", argv[0]);
        return 1;
    }
    
    int n = atoi(argv[1]);
    printf("%d\n", n);

    DIR *dir = opendir(argv[3]);
    if (dir == NULL) {
        printf("opendir with %s failed\n", argv[3]);
        return 1;
    }
    printf("Your code is running.\n");
    return 0;
}