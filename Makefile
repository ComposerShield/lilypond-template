# LilyPond Makefile

.PHONY: all build clean help

# Default target
all: build

# Build all .ly files
build:
	@./build.sh

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	@rm -rf output/*
	@echo "Clean complete!"

# Help target
help:
	@echo "Available targets:"
	@echo "  build   - Compile all .ly files in src/ to output/"
	@echo "  clean   - Remove all files from output/"
	@echo "  help    - Show this help message"

# Individual file compilation (usage: make src/filename.ly)
%.pdf: %.ly
	@echo "Compiling $<..."
	@mkdir -p output
	@lilypond --output=output/ $<
	@echo "Generated: output/$(basename $(notdir $<)).pdf"
	@open output/$(basename $(notdir $<)).pdf