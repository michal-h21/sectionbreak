docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html
readme = README.md
readmetex = readme.tex
examplefile = sectionbreak-example
exampletex = $(examplefile).tex
examplepdf = $(examplefile).pdf
mode = draft
	
all: $(pdffile) $(htmlfile) $(examplepdf)

$(pdffile): $(texfile) $(readmetex) sectionbreak.sty
	lualatex $<

$(htmlfile): $(texfile) $(readmetex) sectionbreak.sty sectionbreak.4ht
	make4ht -um $(mode) $(engine)  $<

$(examplepdf): $(exampletex) sectionbreak.sty
	lualatex $<

$(readmetex): $(readme)
	pandoc -o $@ $<
