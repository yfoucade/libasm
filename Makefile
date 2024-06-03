# Compiler and assembler
CC = gcc
AS = nasm

# Compiler flags
CFLAGS = -Wall -Wextra -Werror -g
ASFLAGS = -f elf64 -g

# Source files
C_SRC = main.c
ASM_SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s \
	ft_write.s  ft_read.s ft_strdup.s

# Object files
C_OBJ = ${C_SRC:.c=.o}
ASM_OBJ = ${ASM_SRC:.s=.o}

# Names
NAME = libasm.a
EXE = a.out

.PHONY = all clean fclean run


all: ${NAME} ${C_OBJ}
	@ ${CC} ${CFLAGS} -L. ${C_OBJ} -o ${EXE} -lasm -z noexecstack -static

${NAME}: ${ASM_OBJ}
	@ ar rcs ${NAME} ${ASM_OBJ}

%.o: %.c
	@ ${CC} ${CFLAGS} -o $@ -c $< -fPIC

%.o: %.s
	@ ${AS} ${ASFLAGS} -o $@ $<

test: ${C_OBJ} ${NAME}
	@ # https://github.com/xoreaxeaxeax/rosenbridge/issues/1
	@ ${CC} ${CFLAGS} -L. ${C_OBJ} -o ${EXE} -lasm -z noexecstack -static

clean:
	@ rm -f ${ASM_OBJ} ${C_OBJ}

fclean: clean
	@ rm -f ${NAME} ${EXE}

re: fclean all
