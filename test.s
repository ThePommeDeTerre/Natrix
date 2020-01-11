	.text
	.globl	main
main:
	subq $8, %rsp
	leaq 0(%rsp), %rbp
	movq $0, %rax
	pushq %rax
	popq %rax
	movq %rax, 0(%rbp)
	movq $4, %rax
	pushq %rax
.for_0:
	popq %rbx
	cmpq 0(%rbp), %rbx
	jl .end_for_0
	pushq %rbx
	movq 0(%rbp), %rax
	pushq %rax
	movq $2, %rax
	pushq %rax
	popq %rbx
	popq %rax
	movq $0, %rdx
	idivq %rbx
	pushq %rdx
	movq $0, %rax
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	sete %dil
	movzbq %dil, %rax
	pushq %rax
	popq %rax
	cmpq $1, %rax
	je .if_1
	movq $0, %rax
	pushq %rax
	popq %rdi
	call .print_bool
	jmp .end_if_else_1
.if_1:
	movq 0(%rbp), %rax
	pushq %rax
	popq %rdi
	call .print_int
	jmp .end_if_else_1
.end_if_else_1:
	incq 0(%rbp)
	jmp .for_0
.end_for_0:
	movq $42, %rax
	pushq %rax
	popq %rdi
	call .print_int
	addq $8, %rsp
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
