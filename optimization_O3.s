	.file	"optimization.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
.LC1:
	.string	"rb"
.LC2:
	.string	"Unable to open file: %s\n"
.LC3:
	.string	"%08lx "
.LC4:
	.string	"%02x "
.LC5:
	.string	"   "
.LC6:
	.string	"|"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L20
	movq	8(%rsi), %rdi
	leaq	.LC1(%rip), %rsi
	call	fopen@PLT
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L21
	movq	$0, (%rsp)
	leaq	16(%rsp), %rbp
	leaq	.LC5(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L4:
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	fread@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L22
	movq	(%rsp), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	movl	$2, %edi
	call	__printf_chk@PLT
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L24:
	movzbl	0(%rbp,%r12), %edx
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r12
	call	__printf_chk@PLT
	cmpq	$16, %r12
	je	.L23
.L8:
	cmpq	%rbx, %r12
	jb	.L24
	movq	%r14, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r12
	call	__printf_chk@PLT
	cmpq	$16, %r12
	jne	.L8
.L23:
	movl	$124, %edi
	movq	%rbp, %r15
	leaq	0(%rbp,%rbx), %r12
	call	putchar@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L12:
	movzbl	(%r15), %ecx
	movq	0(%r13), %rax
	movq	%rcx, %rdi
	testb	$64, 1(%rax,%rcx,2)
	jne	.L18
	movl	$46, %edi
.L18:
	call	putchar@PLT
	addq	$1, %r15
	cmpq	%r15, %r12
	jne	.L12
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	addq	%rbx, (%rsp)
	jmp	.L4
.L22:
	movq	8(%rsp), %rdi
	call	fclose@PLT
	xorl	%eax, %eax
.L1:
	movq	40(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L25
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %eax
	jmp	.L1
.L25:
	call	__stack_chk_fail@PLT
.L21:
	movq	8(%rbx), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
	jmp	.L3
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
