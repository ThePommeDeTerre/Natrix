.text
	.globl	main
main:
	subq $0, %rsp
	leaq -8(%rsp), %rbp
	movq $4, %rax
	pushq %rax
	movq $5, %rax
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	setl %dil
	movzbq %dil, %rax
	pushq %rax
	popq %rdi
	call .print_bool
	addq $0, %rsp
	movq $0, %rax
	ret
.print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	movq $0, %rax
	call printf
	ret
.print_bool:
	cmpq $0, %rdi
	je .print_false
	jne .print_true
.print_true:
	movq %rdi, %rsi
	movq $.true, %rdi
	movq $0, %rax
	call printf
	ret
.print_false:
	movq %rdi, %rsi
	movq $.false, %rdi
	movq $0, %rax
	call printf
	ret
.data
.Sprint_int:
	.string "%d\n"
.true:
	.string "true\n"
.false:
	.string "false\n"
