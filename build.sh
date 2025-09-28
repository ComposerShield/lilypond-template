#!/bin/bash

# LilyPond Build Script
# Compiles all .ly files in src/ directory to output/

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building LilyPond scores...${NC}"

# Check if LilyPond is installed
if ! command -v lilypond &> /dev/null; then
    echo -e "${RED}Error: LilyPond is not installed or not in PATH${NC}"
    echo "Install with: brew install lilypond"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p output

# Find all .ly files in src/
ly_files=$(find src -name "*.ly" -type f)

if [ -z "$ly_files" ]; then
    echo -e "${YELLOW}No .ly files found in src/ directory${NC}"
    exit 0
fi

# Track generated PDFs for opening
generated_pdfs=()

# Process each .ly file
for file in $ly_files; do
    filename=$(basename "$file" .ly)
    echo -e "Processing: ${GREEN}$file${NC}"
    
    # Compile with LilyPond, output to output/ directory
    lilypond --output=output/ "$file"
    
    if [ $? -eq 0 ]; then
        echo -e "✓ Generated: ${GREEN}output/$filename.pdf${NC}"
        generated_pdfs+=("output/$filename.pdf")
    else
        echo -e "${RED}✗ Failed to compile $file${NC}"
        exit 1
    fi
done

echo -e "${GREEN}Build complete!${NC}"
echo "Output files are in the output/ directory"

# Open generated PDFs
if [ ${#generated_pdfs[@]} -gt 0 ]; then
    echo -e "${YELLOW}Opening generated PDFs...${NC}"
    for pdf in "${generated_pdfs[@]}"; do
        open "$pdf"
    done
fi