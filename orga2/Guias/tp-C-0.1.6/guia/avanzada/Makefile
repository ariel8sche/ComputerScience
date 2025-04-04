
SOURCES = C-avanzada.tex 
          
PDFS = $(SOURCES:.tex=.pdf)

PDFFLAGS := -synctex=1 -shell-escape -interaction=nonstopmode

.PHONY: all

all: $(PDFS) 

%.pdf: %.tex
	pdflatex $(PDFFLAGS) $<
	pdflatex $(PDFFLAGS) $<
    
clean:
	rm -rf *.aux *.log *.toc *.pdf *.snm *.out *.gz *.nav *.vrb

