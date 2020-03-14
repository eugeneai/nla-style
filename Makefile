.PHONY: compile tests test-pdflatex test-lualatex test-xelatex

SOURCE=nla.tex
TARGET=$(SOURCE:.tex=.pdf)
# LATEXPARAMS= -shell-escape
LATEXPARAMS= -shell-escape -interaction nonstopmode -halt-on-error -file-line-error
PDFLATEX=pdflatex $(LATEXPARAMS)
LUALATEX=lualatex $(LATEXPARAMS)
XELATEX=xelatex $(LATEXPARAMS)
LATEX=$(PDFLATEX)

ENGSRC=test-eng.tex
ENGTRG=$(ENGSRC:.tex=.pdf)

RUSSRC=test-rus.tex
RUSTRG=$(RUSSRC:.tex=.pdf)

compile: $(TARGET)

$(TARGET): $(SOURCE)
	$(LATEX) $<
	# indexing
	# bibliography processing
	$(LATEX) $<


# tests: test-xelatex
tests: test-pdflatex test-lualatex test-xelatex

test-lualatex:
	rm -f *.aux
	$(LUALATEX) $(ENGSRC)
	$(LUALATEX) $(ENGSRC)
	mv $(ENGTRG) lualatex-$(ENGTRG)
	$(LUALATEX) $(RUSSRC)
	$(LUALATEX) $(RUSSRC)
	mv $(RUSTRG) lualatex-$(RUSTRG)

test-xelatex:
	rm -f *.aux
	$(XELATEX) $(ENGSRC)
	$(XELATEX) $(ENGSRC)
	mv $(ENGTRG) xelatex-$(ENGTRG)
	$(XELATEX) $(RUSSRC)
	$(XELATEX) $(RUSSRC)
	mv $(RUSTRG) xelatex-$(RUSTRG)

test-pdflatex:
	rm -f *.aux
	$(PDFLATEX) $(ENGSRC)
	$(PDFLATEX) $(ENGSRC)
	mv $(ENGTRG) pdflatex-$(ENGTRG)
	$(PDFLATEX) $(RUSSRC)
	$(PDFLATEX) $(RUSSRC)
	mv $(RUSTRG) pdflatex-$(RUSTRG)

clean:
	rm -rf *.aux test-*.pdf *.log
