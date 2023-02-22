#include <stdio.h>
#include <cpuid.h>

int main()
{
    unsigned int a, b, c, d;

    /* 0x81234567 is nonexistent, but assume it exists */
    if (!__get_cpuid (0x81234567, &a, &b, &c, &d)) {
        printf("Warning: CPUID request 0x81234567 not valid!\n");
        return 1;
    }

    printf("EAX: %x\nEBX: %x\nECX: %x\nEDX: %x\n", a, b, c, d);

    return 0;
}
