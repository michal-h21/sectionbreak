docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html
readme = README.md
# readmetex = readme.tex
examplefile = sectionbreak-example
exampletex = $(examplefile).tex
examplepdf = $(examplefile).pdf
examplepng = $(examplefile).png
mode = draft
VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
# VERSION:= $(shell git describe --abbrev=4 --dirty --always --tags)
DATE:= $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))
	
all: $(pdffile) $(htmlfile) $(examplepdf) $(examplepng)

$(pdffile): $(texfile) $(readme) sectionbreak.sty
	lualatex  "\def\version{${VERSION}}\def\gitdate{${DATE}}\input{$<}"

$(htmlfile): $(texfile) $(readme) sectionbreak.sty sectionbreak.4ht $(docfile).mk4
	make4ht -ulm $(mode) $(engine)  $< "fn-in" 

$(examplepdf): $(exampletex) sectionbreak.sty
	lualatex $<

$(examplepng): $(examplepdf)
	gs -sDEVICE=pngalpha -sOutputFile=$@ -r144 $<

# $(readmetex): $(readme)
# 	pandoc -o $@ $<
