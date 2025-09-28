# LilyPond Project

A simple LilyPond project for creating musical scores.

## Prerequisites

Install LilyPond:
```bash
brew install lilypond
```

## Usage

**Build all scores:**
```bash
./build.sh
# or
make build
```

**Clean output:**
```bash
make clean
```

**Help:**
```bash
make help
```

## Project Structure

- `src/` - LilyPond source files (.ly)
- `output/` - Generated PDFs
- `build.sh` - Build script (compiles and opens PDFs)
- `Makefile` - Build automation

## Adding New Scores

1. Create a new `.ly` file in the `src/` directory
2. Run `./build.sh` to compile
3. PDFs will be generated in `output/` and opened automatically