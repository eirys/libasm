# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etran <etran@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/12 14:16:43 by etran             #+#    #+#              #
#    Updated: 2024/01/26 14:56:47 by etran            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ============================================================================ #
#                                    TARGETS                                   #
# ============================================================================ #

# ---------------- FINAL LIBRARY --------------- #
NAME		:=	libasm.a
BONUS		:=	libasm_bonus.a

# --------------- DIRECTORY NAMES -------------- #
SRC_DIR		:=	src
OBJ_DIR		:=	obj
TEST_DIR	:=	tests

# ---------------- SUBDIRECTORIES -------------- #
BONUS_DIR	:=	bonus

SUBDIRS		:=	$(BONUS_DIR)

OBJ_SUBDIRS	:=	$(addprefix $(OBJ_DIR)/,$(SUBDIRS))

# ---------------- SOURCE FILES ---------------- #
SRC_FILES	:=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_strdup.s \
				ft_read.s \
				ft_write.s

BONUS_FILES	:=	$(BONUS_DIR)/ft_list_push_front.s \
				$(BONUS_DIR)/ft_atoi_base.s

SRC			:=	$(addprefix $(SRC_DIR)/,$(SRC_FILES))
OBJ			:=	$(addprefix $(OBJ_DIR)/,$(SRC_FILES:.s=.o))
BONUS_SRC	:=	$(addprefix $(SRC_DIR)/,$(BONUS_FILES))
BONUS_OBJ	:=	$(addprefix $(OBJ_DIR)/,$(BONUS_FILES:.s=.o))

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

.PHONY: bonus
bonus: $(BONUS)

# Test library
$(TEST_BIN): $(NAME)
	@$(CXX) $(CFLAGS) $(TEST_FILE) -o $(TEST_BIN) $(NAME)
	@echo "\`$(TEST_BIN)\` file successfully created."
	@echo "== Running \`$(TEST_BIN)\`... =="
	@./$(TEST_BIN)
	@echo "== Done. =============="
	@make -s clean_test

# Compile mandatory library
$(NAME): $(OBJ)
	@echo "Compiling $(NAME)..."
	@$(ARCHIVER) $(ARFLAGS) $(NAME) $(OBJ)
	@echo "\`$(NAME)\` successfully created."

# Compile bonus library
$(BONUS): $(BONUS_OBJ)
	@echo "Compiling $(BONUS)..."
	@$(ARCHIVER) $(ARFLAGS) $(BONUS) $(BONUS_OBJ)
	@echo "\`$(BONUS)\` successfully created."

# Compile obj files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR) $(OBJ_SUBDIRS)
	@echo "Compiling file $<..."
	@$(ASM) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	@${RM} $(OBJ_DIR)
	@echo "Cleaning object files."

.PHONY: clean_test
clean_test:
	@${RM} $(TEST_BIN)
	@echo "Removed $(TEST_BIN)."

.PHONY: fclean
fclean: clean clean_test
	@${RM} $(NAME)
	@echo "Removed $(NAME)."
	@${RM} $(BONUS)
	@echo "Removed $(BONUS)."

.PHONY: re
re: fclean all