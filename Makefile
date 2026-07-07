# ==========================================
# VICTREEBEL - Master Build System
# ==========================================

# 1. Compiler and Flags
CC = gcc
# -Wall and -Wextra catch bad C habits. -g adds debug symbols for gdb. -O2 optimizes for speed.
CFLAGS = -Wall -Wextra -g -O2

# 2. Include Directories (Where to find your .h blueprints)
INCLUDES = -I./include -I./vendor

# 3. Libraries (The external dependencies)
# Note: Check how friolator's OpenCV-C installed. It might be -lopencvc or require pkg-config.
LIBS = -lcurl -ltesseract -lopencvc 

# 4. Source Files (Automatically find all .c files in these folders)
SRCS = $(wildcard src/*.c) $(wildcard vendor/*.c)

# 5. Object Files (Map every .c file to a .o file)
OBJS = $(SRCS:.c=.o)

# 6. Target Executable Name
TARGET = victreebel

# ==========================================
# BUILD RULES
# ==========================================

# 'make all' is the default target when you just type 'make'
all: $(TARGET)

# Link all the .o files together to create the final binary
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(OBJS) $(LIBS)
	@echo "----------------------------------------"
	@echo " Build complete! Run with: ./$(TARGET)"
	@echo "----------------------------------------"

# Compile each individual .c file into a .o object file
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# 'make clean' to wipe the slate clean
clean:
	rm -f src/*.o vendor/*.o $(TARGET)
	@echo "Cleaned up object files and binary."

# Phony prevents Make from getting confused if a file named "all" or "clean" exists
.PHONY: all clean
