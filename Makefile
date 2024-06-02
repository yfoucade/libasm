# Compiler and assembler
CC = gcc
AS = nasm

# Compiler flags
CFLAGS = -Wall -Wextra -Werror -g
ASFLAGS = -f elf64 -g

# Source files
C_SRC = src/main.c
ASM_SRC = src/ft_strlen.s

# Object files
C_OBJ = ${C_SRC:.c=.o}
ASM_OBJ = ${ASM_SRC:.s=.o}

# Names
NAME = src/libasm.a
EXE = a.out

.PHONY = all clean fclean run


all: ${NAME}

${NAME}: ${ASM_OBJ}
	@ # ld -m elf_x86_64 -o test ${ASM_OBJ}
	@ ar rcs src/libasm.a ${ASM_OBJ}

%.o: %.c
	@ ${CC} ${CFLAGS} -o $@ -c $< 

%.o: %.s
	@ ${AS} ${ASFLAGS} -o $@ $<

test: ${C_OBJ} ${NAME}
	@ ${CC} ${CFLAGS} -Lsrc ${C_OBJ} -o ${EXE} -lasm -z noexecstack

clean:
	@ rm -f ${ASM_OBJ} ${C_OBJ}

fclean: clean
	@ rm -f ${NAME} ${EXE}

re: fclean all

run:
	docker build -t test_asm .
	docker run -v ./:/libasm test_asm
