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
	
all: $(pdffile) $(htmlfile) $(examplepdf) $(examplepng)

$(pdffile): $(texfile) $(readme) sectionbreak.sty
	lualatex  $<

$(htmlfile): $(texfile) $(readme) sectionbreak.sty sectionbreak.4ht
	make4ht -ulm $(mode) $(engine)  $< "fn-in"

$(examplepdf): $(exampletex) sectionbreak.sty
	lualatex $<

$(examplepng): $(examplepdf)
	gs -sDEVICE=pngalpha -sOutputFile=$@ -r144 $<

# $(readmetex): $(readme)
# 	pandoc -o $@ $<
