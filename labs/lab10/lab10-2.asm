%include "in_out.asm"
SECTION .data
msg1 db "Как вас зовут?", 0h
output_file db "result.txt", 0h
msg2 db "Меня зовут ", 0h

SECTION .bss
user_input resb 255

SECTION .text
global _start
_start:
    mov eax, msg1
    call sprintLF

    mov ecx, user_input
    mov edx, 255
    call sread

    mov ecx, 0777o
    mov ebx, output_file
    mov eax, 8
    int 80h

    mov ecx, 2
    mov ebx, output_file
    mov eax, 5
    int 80h

    mov esi, eax

    mov eax, msg2
    call slen
    mov edx, eax
    mov ecx, msg2
    mov ebx, esi
    mov eax, 4
    int 80h

    mov eax, user_input
    call slen
    mov edx, eax
    mov ecx, user_input
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit

