.PHONY: all clean

all: build/proposal.pdf

clean:
	sudo rm -rf build

build/proposal.pdf: build/ build/proposal/index.pdf
	cp build/proposal/index.pdf build/proposal.pdf

build/proposal/index.pdf: proposal/index.tex build/proposal/
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/proposal proposal/index.tex
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/proposal proposal/index.tex
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/proposal proposal/index.tex

build/:
	mkdir -p $@

build/%/:
	mkdir -p $@
