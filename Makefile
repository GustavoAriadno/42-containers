NAME	=	containers

CC		=	g++

FLAG	=	-c				\
			-Wall			\
			-Wextra			\
			-Werror			\
			-Wshadow		\
			-std=c++98

# -Wfatal-error

RM		=	@/bin/rm -rf

SDIR	=	src/
ODIR	=	objects/
INCLUDE	=	includes/

# subject_main.cpp
FILES	=	main.cpp

SRCS	=	$(addprefix $(SDIR), $(FILES))
OBJS	=	$(SRCS:$(SDIR)%.cpp=$(ODIR)%.o)

all		:	$(NAME)

$(NAME)	:	$(OBJS)
			$(CC) $(SANIT) -o $@ $^

objects/%.o	:	srcs/%.cpp
			@mkdir -p $(ODIR)
			$(CC) -g $(FLAG) -I $(INCLUDE) $< -o $@

clean:
	$(RM) $(ODIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re