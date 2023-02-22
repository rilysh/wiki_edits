#include <stdio.h>
#include <cpuid.h>

int main()
{
    unsigned int eax, ebx, ecx, edx;

    __cpuid(0 /* vendor string */, eax, ebx, ecx, edx);
    printf("EAX: %x\nEBX: %x\nECX: %x\nEDX: %x\n", eax, ebx, ecx, edx);

    return 0;
}
