
DOC = projekt1
BUILD_DIR = build

.PHONY: all octave latex clean

all: octave raport

octave:
	@echo "--- Running octave scripts ---"
	octave --no-gui octave/main.m

latex:
	@echo "--- Compiling LaTeX ---"
	mkdir -p $(BUILD_DIR)
	latexmk -pdf -outdir=$(BUILD_DIR) -auxdir=$(BUILD_DIR) $(DOC).tex

clean:
	@echo "--- Cleaning build folder ---"
	rm -rf $(BUILD_DIR)