org 7C00h
bits 16
start:
	cli
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 07C00h
	sti

	mov ax, 0002h
	int 10h
	mov dx, 0
	call set_pos

	mov bp, msg
	mov cx, msglen
	call print

	call load_kernel
	jmp 9000h


print:
	xor bh, bh
	mov bl, 04
	mov ax, 1301h
	int 10h
	ret

set_pos:
	mov ah, 2
	xor bh, bh
	int 10h
	ret

load_kernel:
	mov ah, 02h
	xor dl, dl
	xor dh, dh
	xor ch, ch
	mov cl, 2
	mov al, 1
	mov bx, 9000h
	int 13h
	cmp word [9000h], 0
	jz error
	ret

error:
	mov bp, errormsg
	mov cx, errmsglen
	call print
	ret

msg db 'StupidOS bootloader...'
msglen equ $-msg
errormsg db 'Error...'
errmsglen equ $-errormsg

times (512-2-($-$$)) db 0
db 55h, 0AAh