#include <stdio.h>
#include <cpuid.h>

int main()
{
    unsigned int eax, ebx, ecx, edx;

    /* 0x81234567 is nonexistent, but assume it exists */
    if (!__get_cpuid (0x81234567, &eax, &ebx, &ecx, &edx)) {
        printf("Warning: CPUID request 0x81234567 not valid!\n");
        return 1;
    }

    printf("EAX: %x\nEBX: %x\nECX: %x\nEDX: %x\n", eax, ebx, ecx, edx);

    return 0;
}
