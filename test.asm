section .data
    result db 'Result: ', 0

section .bss
    res resb 1

section .text
    global _start
    extern ExitProcess, WriteConsoleA, GetStdHandle

_start:
    ; Move the value 5 into the EAX register
    mov eax, 5

    ; Add the value 3 to the value in the EAX register
    add eax, 3

    ; Convert the result to ASCII and store it in the 'res' variable
    add eax, '0'
    mov [res], al

    ; Get the handle for the standard output device
    push -11
    call GetStdHandle

    ; Write the result message to the console
    push 0
    push 9
    push result
    push eax
    call WriteConsoleA

    ; Write the result value to the console
    push 0
    push 1
    push res
    push eax
    call WriteConsoleA

    ; Exit the program
    push 0
    call ExitProcess
