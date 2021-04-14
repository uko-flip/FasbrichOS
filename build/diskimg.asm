incbin 'bootloader'
incbin 'kernel'
times (1474560 -($-$$)) db 0