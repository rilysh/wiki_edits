#include <stdio.h>
#include <cpuid.h>

int main()
{
    unsigned int regs[4];

    // TODO: Need more recent CPUs

    __cpuid(0, regs[0], regs[1], regs[2], regs[3]);
    printf("id: 0x%x\n", regs[0]);
}
