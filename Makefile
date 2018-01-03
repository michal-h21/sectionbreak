.PHONY: build tags

packagename = sectionbreak
docfile = sectionbreak-doc
texfile = $(docfile).tex
pdffile = $(docfile).pdf
htmlfile = $(docfile).html

readme = README.md
changelog = CHANGELOG.md
# readmetex = readme.tex
examplefile = $(packagename)-example
exampletex = $(examplefile).tex
examplepdf = $(examplefile).pdf
examplepng = $(examplefile).png

styfile = $(packagename).sty
mode = draft
BUILD_DIR = build
DIST_DIR = $(BUILD_DIR)/$(packagename)
VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
# VERSION:= $(shell git describe --abbrev=4 --dirty --always --tags)
DATE:= $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))
	
all: $(pdffile) $(htmlfile) $(examplepdf) $(examplepng)

tags:
	git fetch --tags

$(pdffile): $(texfile) $(readme) sectionbreak.sty $(changelog)
	lualatex  "\def\version{${VERSION}}\def\gitdate{${DATE}}\input{$<}"

$(htmlfile): $(texfile) $(readme) $(changelog) sectionbreak.sty sectionbreak.4ht $(docfile).mk4
	make4ht -ulm $(mode) $(engine)  $< "fn-in" 

$(examplepdf): $(exampletex) sectionbreak.sty
	lualatex $<

$(examplepng): $(examplepdf)
	gs -sDEVICE=pngalpha -sOutputFile=$@ -r144 $<

build: tags $(pdffile) $(readme) $(styfile) $(exampletex) $(changelog)
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(DIST_DIR)
	@cp $(pdffile) $(texfile) $(styfile) $(exampletex) $(readme) $(changelog) $(DIST_DIR) 
	@cd $(BUILD_DIR) && zip -r $(packagename).zip $(packagename)
# $(readmetex): $(readme)
# 	pandoc -o $@ $<
