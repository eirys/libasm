# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etran <etran@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/12 14:16:43 by etran             #+#    #+#              #
#    Updated: 2024/01/12 14:36:31 by etran            ###   ########.fr        #
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

# ---------------- SUBDIRECTORIES -------------- #
SUBDIRS		:=

OBJ_SUBDIRS	:=	$(addprefix $(OBJ_DIR)/,$(SUBDIRS))
# INC_SUBDIRS	:=	$(addprefix $(SRC_DIR)/,$(SUBDIRS)) \
# 				$(SHD_DIR)

# ---------------- SOURCE FILES ---------------- #
SRC_FILES	:=

SRC			:=	$(addprefix $(SRC_DIR)/,$(SRC_FILES))
# OBJ			:=	$(addprefix $(OBJ_DIR)/,$(SRC_FILES:.cpp=.o))
# DEP			:=	$(addprefix $(OBJ_DIR)/,$(SRC_FILES:.cpp=.d))

# ----------------- COMPILATION ---------------- #
CXX			:=	nasm
EXTRA		:=	-Wall -Werror -Wextra
INCLUDES	:=	$(addprefix -I./,$(INC_SUBDIRS))

MACROS		:=	__DEBUG \
				__INFO

DEFINES		:=	$(addprefix -D,$(MACROS))

CFLAGS		:=	$(EXTRA) \
				$(INCLUDES) \
				-g \
				$(DEFINES)

# -------------------- MISC -------------------- #
RM			:=	rm -rf

# -------------------- TESTS ------------------- #
TEST_BIN	:=	test
TEST_FILE	:=	main.c

# ============================================================================ #
#                                     RULES                                    #
# ============================================================================ #

.PHONY: all
all: $(NAME)

# -include $(DEP)

$(TEST_BIN): $(NAME)
	@$(CXX) $(CFLAGS) $(TEST_FILE) -o $(TEST_BIN) $(NAME)
	@echo "\`$(TEST_BIN)\` successfully created."
	@sleep 1
	@echo "Running \`$(TEST_BIN)\`..."
	@sleep 1
	@./$(TEST_BIN)

# Compile binary
$(NAME): $(SHD_BIN) $(OBJ)
	@$(CXX) $(CFLAGS) $(OBJ) -o $(NAME) $(LDFLAGS)
	@echo "\`$(NAME)\` successfully created."

# Compile obj files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR) $(OBJ_SUBDIRS)
	@echo "Compiling file $<..."
	@$(CXX) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@${RM} $(OBJ_DIR)
	@echo "Cleaning object files and dependencies."

.PHONY: fclean
fclean: clean
	@${RM} $(NAME)
	@echo "Removed $(NAME)."

.PHONY: re
re: fclean all