.text
	.globl	main
main:
	subq $8, %rsp
	leaq 0(%rsp), %rbp
	movq $5, %rax
	pushq %rax
	popq %rax
	movq %rax, 0(%rbp)
	movq $10, %rax
	pushq %rax
	movq $3, %rax
	pushq %rax
	popq %rbx
	popq %rax
	movq $0, %rdx
	idivq %rbx
	pushq %rdx
	popq %rdi
	call print_int
	addq $8, %rsp
	movq $0, %rax
	ret
print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	movq $0, %rax
	call printf
	ret
.data
.Sprint_int:
	.string "%d\n"
