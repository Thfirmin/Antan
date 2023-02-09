# **************************************************************************** #
#                                                                              #
#                                                   ::::::::::: ::::::::::     #
#    Makefile                                          :+:     :+:             #
#                                                     +:+     +:+              #
#    By: Thinotsuki <thinotsukimichi@gmail.com>      +#+     :#::+::#          #
#                                                   +#+     +#+                #
#    Created: 2022/09/16 07:38:43 by Thinotsuki    #+#     #+#                 #
#    Updated: 2022/10/03 02:06:36 by Thinotsuki   ###     ###.br               #
#                                                                              #
# **************************************************************************** #

# +>                                     NAME 

NAME	= antan
# <+-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' #
# +>                                    SOURCES 

SRCS_FILE	= antan.c                \
			  antan_main.c           \
			  antan_error_handler.c  \
			  antan_utils.c          \
			  antan_validate_utils.c \
			  antan_treatment.c      \

OBJS_FILE	= $(subst .c,.o,$(SRCS_FILE))

SRCS	= $(foreach  src_files, $(SRCS_FILE), $(SRCS_PATH)$(src_files))

OBJS	= $(foreach obj_files, $(OBJS_FILE), $(OBJS_PATH)$(obj_files))
# <+-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' #
# +>                                    ALIASES 

SRCS_PATH	= srcs/
OBJS_PATH	= objs/

SRC_CVTD	= $(subst $(OBJS_PATH),$(SRCS_PATH),$(subst .o,.c,$@))
SRC_FND		= "$(findstring $(SRC_CVTD), $?)"

INCLUDE		= -I includes/
RM			= rm -rf
CC			= cc
CFLAGS		= 
#MAKEFLAGS	+= --silent
# <+-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' #
# +>                                     CODES 

BLANK			= \e[m
RED				= \e[38;5;9m
YELLOW			= \e[38;5;11m
GREEN			= \e[38;5;2m
BLUE			= \e[38;5;6m
PURPLE			= \e[38;5;5m
PINK			= \e[38;5;13m
WHITE			= \e[38;5;15m

STRONG			= \e[1m
SHADOW			= \e[2m
ITALIC			= \e[3m
UNDLINE			= \e[4m
UPPLINE			= \e[53m
DUNDLINE		= \e[21m
CENSORED		= \e[9m
UPALIGN			= \e[73m
DWALIGN			= \e[74m
FULLER			= \e[7m
# <+-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' #
# +>                                     RULES 

all:		$(NAME)

$(NAME):	$(OBJS)
	$(CC) $(INCLUDE) -g $(OBJS) -o ./$(NAME)

$(OBJS): $(OBJS_PATH) $(SRCS)
	@if [ $(SRC_FND) = "$(SRC_CVTD)" ]; then \
		echo $(CC) $(INCLUDE) -g -c $(SRC_CVTD) -o $@; \
		$(CC) $(INCLUDE) -g -c $(SRC_CVTD) -o $@; \
	fi
#	$(CC) $(INCLUDE) -g -c$(subst $(OBJS_PATH), $(SRCS_PATH), $*).c -o $@
#	echo $@	#Nome da regra. 
#	echo $<	#Nome da primeira dependência 
#	echo $^	#Lista de dependências
#	echo $?	#Lista de dependências mais recentes que a regra.
#	echo $*	#Nome do arquivo sem sufixo

$(OBJS_PATH):
	mkdir objs

clean:
	$(RM) $(OBJS_PATH)

fclean:		clean
	$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
# <+-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' #
# vim: fdm=marker fmr=+>,<+ ts=4 sw=4 nofen noet:
