.PHONY: compile

SOURCE=nla.tex
TARGET=$(SOURCE:.tex=.pdf)
LATEX=pdflatex -shell-escape
#LATEX=lualatex -shell-escape

compile: $(TARGET)

$(TARGET): $(SOURCE)
	$(LATEX) $<
	# indexing
	# bibliography processing
	$(LATEX) $<
