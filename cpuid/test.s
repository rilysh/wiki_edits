	.text
	.file	"test.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$1, %eax
	#APP
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	#NO_APP
	movl	%esi, -24(%rbp)                 # 4-byte Spill
	movl	%eax, %esi
	movl	-24(%rbp), %eax                 # 4-byte Reload
	movl	%esi, -4(%rbp)
	movl	%eax, -8(%rbp)
	movl	%ecx, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-4(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	xorl	%eax, %eax
	#APP
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	#NO_APP
	movl	%esi, -20(%rbp)                 # 4-byte Spill
	movl	%eax, %esi
	movl	-20(%rbp), %eax                 # 4-byte Reload
	movl	%esi, -4(%rbp)
	movl	%eax, -8(%rbp)
	movl	%ecx, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-4(%rbp), %esi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	leaq	-8(%rbp), %rsi
	leaq	-16(%rbp), %rdx
	movabsq	$.L.str.2, %rdi
	leaq	-4(%rbp), %rcx
	movb	$0, %al
	callq	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"CPUID: %x\n"
	.size	.L.str, 11

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Largest basic function number implemented: %i\n"
	.size	.L.str.1, 47

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Vendor ID: %s%s%s\n"
	.size	.L.str.2, 19

	.ident	"clang version 12.0.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
