;lt301a.asm
        .model small
        .stack
        .data
string  db 'Hello, Everybody !',0dh,0ah,'$'
        .code
start:  mov ax,@data
	mov ds,ax
        mov d x,of fset string
        mov a h,9 h
        int 2 1h

        mov ax,4c00h
	int 21h
        ;end start