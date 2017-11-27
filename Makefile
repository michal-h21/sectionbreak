docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html
mode = draft
	
all: $(pdffile) $(htmlfile)

$(pdffile): $(texfile)
	lualatex $<

$(htmlfile): $(texfile) sectionbreak.sty sectionbreak.4ht
	make4ht -um $(mode) $(engine)  $<
