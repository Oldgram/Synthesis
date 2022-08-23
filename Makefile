SUBDIRS := $(filter-out Template/ TexMakerSessions/, $(wildcard */))

.PHONY: all $(SUBDIRS) clean

all: $(SUBDIRS) clean

$(SUBDIRS):
	-cd $@ && \
	pdflatex -halt-on-error -shell-escape -synctex=1 -file-line-error -interaction=batchmode main.tex && \
	pdflatex -halt-on-error -shell-escape -synctex=1 -file-line-error -interaction=batchmode main.tex && \
	mv main.pdf $(realpath $@).pdf

clean:
	find . -type f \( -iname \*.log -o -iname \*.bak -o -iname \*.aux -o -iname \*.gz -o -iname \*.out -o -iname \*.toc \) -delete
	-find . -type d -name *_minted* -exec rm -r "{}" \;
