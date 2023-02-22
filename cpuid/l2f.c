#include <stdio.h>
#include <cpuid.h>

int main()
{
    unsigned int eax, ebx, ecx, edx;
    unsigned int lsize, assoc, cache;

    __cpuid(0x80000006, eax, ebx, ecx, edx);
    
    lsize = ecx & 0xff;
    assoc = (ecx >> 12) & 0x07;
    cache = (ecx >> 16) & 0xffff;

    printf("Line size: %d B, Assoc. type: %d, Cache size: %d KB.\n", lsize, assoc, cache);

    return 0;
}
