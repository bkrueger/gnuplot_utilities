PLTS = $(wildcard *.plt)
TEXE = $(patsubst %.plt,%.tex,$(PLTS))
DVIS = $(patsubst %.plt,%.dvi,$(PLTS))
PS   = $(patsubst %.plt,%.ps,$(PLTS))
PDFS = $(patsubst %.plt,%.pdf,$(PLTS))

all: $(PDFS)

%.pdf : %.ps
	ps2pdf $<

%.ps : %.dvi
	dvips -o $@ $<

%.dvi : %.tex
	latex $<

%.tex : %.plt
	gnuplot $<