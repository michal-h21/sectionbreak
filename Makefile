docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html
readme = README.md
# readmetex = readme.tex
# examplefile = sectionbreak-example
exampletex = $(examplefile).tex
examplepdf = $(examplefile).pdf
mode = draft
	
all: $(pdffile) $(htmlfile) $(examplepdf)

$(pdffile): $(texfile) $(readme) sectionbreak.sty
	lualatex  $<

$(htmlfile): $(texfile) $(readme) sectionbreak.sty sectionbreak.4ht
	make4ht -ulm $(mode) $(engine)  $< "fn-in"

$(examplepdf): $(exampletex) sectionbreak.sty
	lualatex $<

# $(readmetex): $(readme)
# 	pandoc -o $@ $<
