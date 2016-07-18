.PHONY: all clean

all: build/proposal.pdf build/letter.pdf build/act.pdf

clean:
	@echo "**************************************************"
	@echo "Cleaning up"
	@echo "**************************************************"
	sudo rm -rf build

build/%.pdf: proposal/%.tex build/%/
	@echo "**************************************************"
	@echo "Building $*"
	@echo "**************************************************"
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/$* proposal/$*.tex
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/$* proposal/$*.tex
	docker run -it --rm -v $$PWD:/src -w /src kozily/latex pdflatex --output-directory build/$* proposal/$*.tex
	cp build/$*/$*.pdf build/$*.pdf

build/:
	mkdir -p $@

build/%/:
	mkdir -p $@
