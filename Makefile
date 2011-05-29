MAIN=ud-interview
SOURCES=$(MAIN).tex
SLIDES=s-*.tex
SUBDIRS=
SHELL=/bin/bash
TEMPFILES=slides.tex slides-appendix.tex

.PHONY: all subdirs

all: $(MAIN).pdf

subdirs: 
	for dir in $(SUBDIRS); do  $(MAKE) -C $$dir;  done

$(MAIN).pdf: $(SOURCES)
	pdflatex $(MAIN)
#	bibtex $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)

handout: $(MAIN)-handout.pdf
	
$(MAIN)-handout.pdf: $(MAIN)-handout.tex
	pdflatex $(MAIN)-handout
	pdflatex $(MAIN)-handout
	pdflatex $(MAIN)-handout

view: $(MAIN).pdf
	okular $(MAIN).pdf </dev/null>/dev/null 2>&1&

view-handout: $(MAIN).pdf
	okular $(MAIN)-handout.pdf &

abstract: abstract.pdf

abstract.pdf: abstract.tex
	pdflatex abstract
	bibtex abstract
	pdflatex abstract
	pdflatex abstract

rtf: abstract.rtf

abstract.rtf: abstract.pdf
	latex2rtf abstract

clean:
	rm -f *~ $(TEMPFILES) $(MAIN).aux $(MAIN).bbl $(MAIN).blg \
			$(MAIN).log $(MAIN).pdf $(MAIN).snm \
			$(MAIN).toc $(MAIN).nav $(MAIN).out \
			abstract.aux abstract.bbl abstract.blg \
			abstract.log abstract.pdf abstract.snm \
			abstract.toc abstract.nav abstract.out abstract.rtf\
			$(MAIN)-handout.aux $(MAIN)-handout.bbl $(MAIN)-handout.blg\
			$(MAIN)-handout.log $(MAIN)-handout.pdf $(MAIN)-handout.snm\
			$(MAIN).-handouttoc $(MAIN)-handout.nav $(MAIN)-handout.out
