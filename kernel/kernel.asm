org 9000h

start:
	xor bh, bh
	mov cx, 1
	mov al, 'S'
	mov ah, 0Ah
	int 10h
	jmp $