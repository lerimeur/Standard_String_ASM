CC			?=	gcc

ASM			=	nasm

RM			?=	rm -f

SRC			=	src/strlen.s		\
				src/memset.s		\
				src/strchr.s		\
				src/memcpy.s		\
				src/strcasecmp.s	\
				src/rindex.s		\
				src/strncmp.s		\
				src/memmove.s		\
				src/strstr.s		\
				src/strpbrk.s		\
				src/strcspn.s		\
				src/strcmp.s		\

LIB_NAME	=	libasm.so

%.o:%.s
		$(ASM) -f elf64 $(ASFLAGS) $< -o $@

OBJ	 =   $(SRC:.s=.o)

all:	$(OBJ)
		ld -shared -o $(LIB_NAME) $(OBJ)

clean:
			$(RM) $(OBJ)
			$(RM) a.out
			$(RM) main.o

fclean:	 clean
			$(RM) $(LIB_NAME)
			$(RM) *.gcno
			$(RM) *.gcda
			$(RM) unit-tests

re:			 fclean all

.PHONY:	 all clean fclean re tests_run