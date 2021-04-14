@echo off
cd boot 
nasm -f bin bootloader.asm -o ..\build\bootloader
cd ..\kernel
nasm -f bin kernel.asm -o ..\build\kernel
cd ..\build
nasm -f bin diskimg.asm
cd ..