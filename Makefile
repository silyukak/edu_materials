SHELL := /bin/sh

LATEXMK ?= latexmk
LATEXMK_FLAGS ?= -xelatex -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all clean distclean help

all:
	@find . -type f -name '*.tex' -not -path './.git/*' -print | \
	while IFS= read -r source; do \
		directory=$$(dirname "$$source"); \
		filename=$$(basename "$$source"); \
		printf '\n==> %s\n' "$$source"; \
		(cd "$$directory" && $(LATEXMK) $(LATEXMK_FLAGS) "$$filename"); \
	done

clean:
	@find . -type f \( \
		-name '*.aux' -o -name '*.log' -o -name '*.out' -o -name '*.toc' \
		-o -name '*.fls' -o -name '*.fdb_latexmk' -o -name '*.synctex.gz' \
		-o -name '*.bbl' -o -name '*.blg' -o -name '*.nav' -o -name '*.snm' \
		-o -name '*.vrb' \
	\) -not -path './.git/*' -delete

distclean: clean
	@find . -type f -name '*.pdf' -not -path './.git/*' -delete

help:
	@printf '%s\n' \
		'make          собрать все TeX-документы через XeLaTeX' \
		'make clean    удалить временные файлы LaTeX' \
		'make distclean удалить временные файлы и PDF'