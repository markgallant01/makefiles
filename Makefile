# compiler
CC = g++

# target files
OBJS = *.cpp

# compiler flags
DEBUG_FLAGS = -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion \
	      -Werror -pedantic-errors -O0 -ggdb
RELEASE_FLAGS = -w -O2 -DNDEBUG

# linker flags
LINKER_FLAGS =

# standard specification
STD = -std=c++23

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

