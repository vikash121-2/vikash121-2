# Compiler settings
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g
TARGET = main
SRCDIR = src/c
BUILDDIR = build
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Default target
all: $(TARGET)

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Build object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.c | $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Build main executable
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(BUILDDIR)/$(TARGET)

# Build and run
run: $(TARGET)
	./$(BUILDDIR)/$(TARGET)

# Build target
build: $(TARGET)
	@echo "Build completed successfully!"
	@echo "Executable: $(BUILDDIR)/$(TARGET)"

# Clean build files
clean:
	rm -rf $(BUILDDIR) *.out *.exe

# Install dependencies (if any)
install:
	@echo "Installing C development dependencies..."
	@echo "Make sure you have gcc installed"

# Help target
help:
	@echo "Available make commands:"
	@echo "  make build    - Compile the C program"
	@echo "  make run      - Compile and run the C program"
	@echo "  make clean    - Remove build files"
	@echo "  make help     - Show this help message"
	@echo "  make install  - Show installation instructions"

# Create example source file if it doesn't exist
init:
	mkdir -p $(SRCDIR)
	@if [ ! -f $(SRCDIR)/main.c ]; then \
		echo '#include <stdio.h>' > $(SRCDIR)/main.c; \
		echo '' >> $(SRCDIR)/main.c; \
		echo 'int main() {' >> $(SRCDIR)/main.c; \
		echo '    printf("Hello, World!\\n");' >> $(SRCDIR)/main.c; \
		echo '    return 0;' >> $(SRCDIR)/main.c; \
		echo '}' >> $(SRCDIR)/main.c; \
		echo "Created example C program in $(SRCDIR)/main.c"; \
	fi

.PHONY: all build run clean help install init