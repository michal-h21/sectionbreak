docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html
examplefile = sectionbreak-example
exampletex = $(examplefile).tex
examplepdf = $(examplefile).pdf
mode = draft
	
all: $(pdffile) $(htmlfile) $(examplepdf)

$(pdffile): $(texfile)
	lualatex $<

$(htmlfile): $(texfile) sectionbreak.sty sectionbreak.4ht
	make4ht -um $(mode) $(engine)  $<

$(examplepdf): $(exampletex)
	lualatex $<
