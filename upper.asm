;�պ��� 2011.9.29 Сд��ĸת���ɴ�д��Ļ
;���ս���Ȩ���պ�������
.model small
.stack
.data
msgkey  db 'Press any key to continue ...','$'
msgin	db 'input:','$'
msgout	db 'output:','$'
enterr	db 0dh,0ah,'$'
.code
start:	mov ax,@data
	mov ds,ax;����ʼ
	call clear
	;mov ah,00h
	;mov al,05h
	;int 10h
	
	mov ah,06h
	mov bh,0a8h;
	int 10h

	mov AH,01h
	int 21h;����01�ӹ��ܣ�����ʾ�������ַ����ŵ�al��
	push ax;al��ջ����
	call enter;����

	mov ah,09h
	mov dx,offset msgin;��ʾ��ʾ��ʾ����Ϊ
	int 21h;����09�Ź���

	pop dx;��ջ
	push dx;��ջ����
	mov ah,02h
	int 21h;������ʾ��ʾСд��ĸ
	call enter;����

	mov ah,09h
	mov dx,offset msgout;��ʾ��ʾ��ʾ����Ϊ
	int 21h;����09�Ź���

	pop dx;��ջ
	xor dl,20h;asic��20��ת��Ϊ��д����al��(sub al,20h)xor dl,09h
	mov ah,02h
	int 21h;������ʾ
	call enter;����

	mov ah,09h
	mov dx,offset msgkey;��ʾ��ʾ
	int 21h;����09�Ź���
	mov ah,01h
	int 21h;��ͣ���ȴ��������

	mov ax,4c00h;����dos
	int 21h

enter	proc;�����ӳ���
	mov ah,09h
	mov dx,offset enterr;��ʾ��ʾ
	int 21h;����09�Ź���
enterend:	ret
enter	endp

clear	proc;�����ӳ���
	mov ah,06h;06�Ź���
        mov al,0;�崰��
        int 10h;10��bios�ж�
	ret
clear	endp

	end start

