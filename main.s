.intel_syntax noprefix
.global main

main:
    mov rcx, 0x0
.L.loop:
    inc rcx
    # div result in rax, remainder in rdx
    mov rdx, 0x0
    mov rax, rcx
    mov r15, 0xf
    div r15
    cmp rdx, 0
    jne .L.buzz.checker
    # write "fizzbuzz"
    mov rdx, 0x9
    lea rsi, [.L.str.fizzbuzz]
    mov rdi, 0x1
    mov rax, 0x1
    push rcx
    syscall
    pop rcx
    jmp .L.next
.L.buzz.checker:
    mov rdx, 0x0
    mov rax, rcx
    mov r15, 0x5
    div r15
    cmp rdx, 0
    jne .L.fizz.checker
    # write "buzz"
    mov rdx, 0x5
    lea rsi, [.L.str.buzz]
    mov rdi, 0x1
    mov rax, 0x1
    push rcx
    syscall
    pop rcx
    jmp .L.next
.L.fizz.checker:
    mov rdx, 0x0
    mov rax, rcx
    mov r15, 0x3
    div r15
    cmp rdx, 0
    jne .L.newline
    # write "fizz"
    mov rdx, 0x5
    lea rsi, [.L.str.fizz]
    mov rdi, 0x1
    mov rax, 0x1
    push rcx
    syscall
    pop rcx
    jmp .L.next
.L.newline:
    # write new-line
    mov rdx, 0x1
    lea rsi, [.L.str.newline]
    mov rdi, 0x1
    mov rax, 0x1
    push rcx
    syscall
    pop rcx
.L.next:
    cmp rcx, 0x1e
    je .L.exit
    jmp .L.loop
.L.exit:
    mov rax, 0x3c
    syscall
.L.str.fizzbuzz:
    .ascii "fizzbuzz\n"
.L.str.fizz:
    .ascii "fizz\n"
.L.str.buzz:
    .ascii "buzz\n"
.L.str.newline:
    .ascii "\n"
