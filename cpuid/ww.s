	.data

s0:	.asciz	"CPUID: %x\n"
s1:	.asciz	"Largest basic function number implemented: %i\n"
s2:	.asciz	"Vendor ID: %.12s\n"

	.text

	.align	32
	.globl	main

main:
	pushq	%rbp
	movq	%rsp,%rbp
	subq	$16,%rsp

	movl	$1,%eax
	cpuid

	leaq	s0(%rip),%rdi
	movl	%eax,%esi
	xorl	%eax,%eax
	call	printf

	pushq	%rbx

	xorl	%eax,%eax
	cpuid

	movl	%ebx,8(%rsp)
	movl	%edx,12(%rsp)
	movl	%ecx,16(%rsp)

	popq	%rbx

	leaq	s1(%rip),%rdi
	movl	%eax,%esi
	xorl	%eax,%eax
	call	printf

	leaq	s2(%rip),%rdi
	movq	%rsp,%rsi
	xorl	%eax,%eax
	call	printf

	movq	%rbp,%rsp
	popq	%rbp
//	ret
	movl	$1,%eax
	int	$0x80
	
	gnu_stack: .section .note.GNU-stack,"",@progbits