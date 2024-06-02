NAME = src/libasm.a

ASM_OBJ = src/ft_strlen.o

all: ${NAME}

${NAME}: ${ASM_OBJ}
	# ld -m elf_x86_64 -o test ${ASM_OBJ}
	ar rcs src/libasm.a ${ASM_OBJ}

%.o: %.s
	nasm -g -f elf64 -o $@ $<

clean:
	rm -f ${ASM_OBJ}

fclean: clean
	rm -f ${NAME}

re: fclean all

run:
	docker build -t test_asm .
	docker run -v ./:/libasm test_asm
