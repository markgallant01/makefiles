# compiler
CC = gcc

# target files
OBJS = *.c

# compiler flags
DEBUG_FLAGS = -Wsign-conversion -Wall -Wextra -Wconversion -Werror \
							-pedantic-errors -O0 -ggdb
RELEASE_FLAGS = -w -O2 -DNDEBUG

# linker flags
LINKER_FLAGS = -lSDL2

# standard specification
STD = -std=c17

all : $(OBJS)
	$(CC) $(STD) $(DEBUG_FLAGS) $(LINKER_FLAGS) -o debugExe $(OBJS)

release: $(OBJS)
	$(CC) $(STD) $(RELEASE_FLAGS) $(LINKER_FLAGS) -o releaseExe $(OBJS)

clean:
	rm -f debugExe releaseExe

# run this once to generate a compile_Flags file so the clangd LSP
# knows what standard to use
init:
	echo $(STD) > compile_flags.txt

