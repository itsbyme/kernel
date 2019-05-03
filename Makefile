NAME=kernel
VERSION=0.0.1

SOURCE_C=kernel.c
SOURCE_ASM=kernel.asm
LINK=link.ld
OBJ=kasm.o kc.o
OUTPUT=-o
FULL_NAME=$(NAME)_$(VERSION)

NASM=nasm
CC=cc
LD=ld

$(NAME): $(OBJ)
	@echo LINK $(FULL_NAME)

install: $(NAME)
	@$(LD) -m elf_i386 -T $(LINK) $(OUTPUT) $(FULL_NAME) $(OBJ)
	@echo BUILT $(FULL_NAME)

clean:
	@rm -f *.o
	@echo CLEAN

kc.o: kernel.c
	@echo CC ks.o
	@$(CC) -m32 -c kernel.c $(OUTPUT) kc.o

kasm.o: kernel.asm
	@echo ASM kasm.o
	@$(NASM) -f elf32 kernel.asm $(OUTPUT) kasm.o 
