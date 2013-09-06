TEXE = $(wildcard *.tex)
DVIS = $(patsubst %.tex,%.dvi,$(TEXE))
PS   = $(patsubst %.tex,%.ps,$(TEXE))
PDFS = $(patsubst %.tex,%.pdf,$(TEXE))

all: $(PDFS)

%.pdf : %.ps
	ps2pdf $<

%.ps : %.dvi
	dvips -o $@ $<

%.dvi : %.tex
	latex $<