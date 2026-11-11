all: pdf

pdf:
	pdflatex -interaction=nonstopmode -halt-on-error main.tex
	biber main
	pdflatex -interaction=nonstopmode -halt-on-error main.tex
	pdflatex -interaction=nonstopmode -halt-on-error main.tex

quick:
	pdflatex -interaction=nonstopmode main.tex

clean:
	rm -f main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc

distclean: clean
	rm -f main.pdf

.PHONY: all pdf quick clean distclean
