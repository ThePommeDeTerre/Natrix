.text
	.globl	main
main:
	# print int de 2 a 10
	subq $8, %rsp
	leaq 0(%rsp), %rbp
	movq $0, %rax
	movq %rax, 0(%rbp)

	movq $10, %rbx
	pushq %rbx


.L1:
	popq %rbx
	cmpq 0(%rbp), %rbx
	jl .getFucked
	movq 0(%rbp), %rdi
	call .print_int

	pushq %rbx
	incq 0(%rbp)

	jmp .L1

.getFucked:
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
