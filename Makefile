MAIN=segmentation
SLIDES=s-*.tex
SOURCES=$(MAIN).tex $(SLIDES)
SUBDIRS=
SHELL=/bin/bash
TEMPFILES=slides.tex slides-appendix.tex
LATEX=pdflatex --shell-escape

%.tikz.tex: %.R
	R --quiet --no-save < $< 


.PHONY: all subdirs

all: $(MAIN).pdf

subdirs: 
	for dir in $(SUBDIRS); do  $(MAKE) -C $$dir;  done

$(MAIN).pdf: $(SOURCES)
	$(LATEX) $(MAIN)
#	bibtex $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

handout: $(MAIN)-handout.pdf
	
$(MAIN)-handout.pdf: $(MAIN)-handout.tex
	$(LATEX) $(MAIN)-handout
	$(LATEX) $(MAIN)-handout
	$(LATEX) $(MAIN)-handout

view: $(MAIN).pdf
	okular $(MAIN).pdf </dev/null>/dev/null 2>&1&

view-handout: $(MAIN).pdf
	okular $(MAIN)-handout.pdf &

abstract: abstract.pdf

abstract.pdf: abstract.tex
	$(LATEX) abstract
	bibtex abstract
	$(LATEX) abstract
	$(LATEX) abstract

rtf: abstract.rtf

abstract.rtf: abstract.pdf
	latex2rtf abstract

$(MAIN)-handout.tex: $(SOURCES)
	sed '/%_SLIDES_ONLY_%/d;s/._HANDOUT_//' $(MAIN).tex > $(MAIN)-handout.tex

clean:
	rm -f *~ $(TEMPFILES) $(MAIN).aux $(MAIN).bbl $(MAIN).blg \
			$(MAIN).log $(MAIN).pdf $(MAIN).snm \
			$(MAIN).toc $(MAIN).nav $(MAIN).out \
			abstract.aux abstract.bbl abstract.blg \
			abstract.log abstract.pdf abstract.snm \
			abstract.toc abstract.nav abstract.out abstract.rtf\
			$(MAIN)-handout.aux $(MAIN)-handout.bbl $(MAIN)-handout.blg\
			$(MAIN)-handout.log $(MAIN)-handout.pdf $(MAIN)-handout.snm\
			$(MAIN)-handout.toc $(MAIN)-handout.nav $(MAIN)-handout.out\
			$(MAIN)-habndout.tex
