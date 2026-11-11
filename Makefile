TEXINPUTS := $(CURDIR)/paper/template:
export TEXINPUTS

all: pdf

pdf:
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error main.tex
	cd paper && biber main
	cd paper && pdflatex -interaction=nonstopmode main.tex
	cd paper && pdflatex -interaction=nonstopmode main.tex

quick:
	cd paper && pdflatex -interaction=nonstopmode main.tex

clean:
	cd paper && rm -f main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc

distclean: clean
	cd paper && rm -f main.pdf

.PHONY: all pdf quick clean distclean
