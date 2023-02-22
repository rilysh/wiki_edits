#include <stdio.h>
#ifdef __MSVC__
    #include <intrin.h>
#endif

int main()
{
    unsigned int regs[4];
    int i;

    for (i = 0; i < 4; i++) {
        __cpuid(regs, i);
        printf("The code %d gives %d, %d, %d, %d", regs[0], regs[1], regs[2], regs[3]);
    }

    return 0;
}
