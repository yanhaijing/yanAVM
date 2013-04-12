;颜海镜 2011.9.29 小写字母转换成大写字幕
;最终解释权归颜海镜所有
.model small
.stack
.data
msgkey  db 'Press any key to continue ...','$'
msgin	db 'input:','$'
msgout	db 'output:','$'
enterr	db 0dh,0ah,'$'
.code
start:	mov ax,@data
	mov ds,ax;程序开始
	call clear
	;mov ah,00h
	;mov al,05h
	;int 10h
	
	mov ah,06h
	mov bh,0a8h;
	int 10h

	mov AH,01h
	int 21h;调用01子功能，从显示器输入字符，放到al里
	push ax;al进栈保存
	call enter;换行

	mov ah,09h
	mov dx,offset msgin;显示提示提示输入为
	int 21h;调用09号功能

	pop dx;出栈
	push dx;进栈保护
	mov ah,02h
	int 21h;调用显示显示小写字母
	call enter;换行

	mov ah,09h
	mov dx,offset msgout;显示提示提示输入为
	int 21h;调用09号功能

	pop dx;出栈
	xor dl,20h;asic减20，转换为大写，在al中(sub al,20h)xor dl,09h
	mov ah,02h
	int 21h;调用显示
	call enter;换行

	mov ah,09h
	mov dx,offset msgkey;显示提示
	int 21h;调用09号功能
	mov ah,01h
	int 21h;暂停，等待输入继续

	mov ax,4c00h;返回dos
	int 21h

enter	proc;换行子程序
	mov ah,09h
	mov dx,offset enterr;显示提示
	int 21h;调用09号功能
enterend:	ret
enter	endp

clear	proc;清屏子程序
	mov ah,06h;06号功能
        mov al,0;清窗口
        int 10h;10号bios中断
	ret
clear	endp

	end start

