#include <stdio.h>

int main()
{
    unsigned int a, b, c, d, i = 0;

    __asm {
        /* Do the call. */
        mov EAX, i;
        cpuid;
        /* Save results. */
        mov a, EAX;
        mov b, EBX;
        mov c, ECX;
        mov d, EDX;
    }

    printf ("InfoType %x\nEAX: %x\nEBX: %x\nECX: %x\nEDX: %x\n", i, a, b, c, d);
    return 0;
}
