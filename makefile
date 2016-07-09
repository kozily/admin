.PHONY: all clean

DOC_NAMES=proposal
DOC_PATHS=$(addsuffix /index.pdf, $(addprefix build/, $(DOC_NAMES)))

all: $(DOC_PATHS)

clean:
	sudo rm -rf build

build/%/index.pdf: %/index.tex build/%/
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/$* $*/index.tex

build/%/:
	mkdir -p $@
