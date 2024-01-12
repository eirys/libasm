# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etran <etran@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/12 14:16:43 by etran             #+#    #+#              #
#    Updated: 2024/01/12 19:41:35 by etran            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ============================================================================ #
#                                    TARGETS                                   #
# ============================================================================ #

# ---------------- FINAL LIBRARY --------------- #
NAME		:=	libasm.a

# --------------- DIRECTORY NAMES -------------- #
SRC_DIR		:=	src
OBJ_DIR		:=	obj
TEST_DIR	:=	tests

# ---------------- SUBDIRECTORIES -------------- #
LIB_DIR		:=	lib
BONUS_DIR	:=	$(LIB_DIR)/bonus

SUBDIRS		:=	$(LIB_DIR) \
				$(BONUS_DIR)

OBJ_SUBDIRS	:=	$(addprefix $(OBJ_DIR)/,$(SUBDIRS))

# ---------------- SOURCE FILES ---------------- #
SRC_FILES	:=	hello.s \
				$(addprefix $(LIB_DIR)/,ft_strlen.s)

SRC			:=	$(addprefix $(SRC_DIR)/,$(SRC_FILES))
OBJ			:=	$(addprefix $(OBJ_DIR)/,$(SRC_FILES:.s=.o))

# ----------------- COMPILATION ---------------- #
ASM			:=	nasm
ASFLAGS		:=	-felf64

ARCHIVER	:=	ar
ARFLAGS		:=	rcs

# -------------------- MISC -------------------- #
RM			:=	rm -rf

# -------------------- TESTS ------------------- #
TEST_BIN	:=	test

MACROS		:=	__VERBOSE

DEFINES		:=	$(addprefix -D,$(MACROS))

CXX			:=	gcc
CFLAGS		:=	$(EXTRA) \
				$(DEFINES)

TEST_FILE	:=	$(TEST_DIR)/main.c

# ============================================================================ #
#                                     RULES                                    #
# ============================================================================ #

.PHONY: all
all: $(NAME)

$(TEST_BIN): $(NAME)
	@$(CXX) $(CFLAGS) $(TEST_FILE) -o $(TEST_BIN) $(NAME)
	@echo "\`$(TEST_BIN)\` successfully created."
	@echo "== Running \`$(TEST_BIN)\`... =="
	@./$(TEST_BIN)
	@echo "== Done. =============="
	@make -s clean_test

# Compile library
$(NAME): $(OBJ)
	@echo "Compiling $(NAME)..."
	@$(ARCHIVER) $(ARFLAGS) $(NAME) $(OBJ)
	@echo "\`$(NAME)\` successfully created."

# Compile obj files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR) $(OBJ_SUBDIRS)
	@echo "Compiling file $<..."
	@$(ASM) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	@${RM} $(OBJ_DIR)
	@echo "Cleaning object files and dependencies."

.PHONY: clean_test
clean_test:
	@${RM} $(TEST_BIN)
	@echo "Removed $(TEST_BIN)."

.PHONY: fclean
fclean: clean clean_test
	@${RM} $(NAME)
	@echo "Removed $(NAME)."

.PHONY: re
re: fclean all