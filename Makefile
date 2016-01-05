ifeq (,$(shell sh -c 'cygpath --version 2> /dev/null'))
  # Unix
  pwd := $$(pwd)
  translate = $1
else
  # Windows mit MSys2/Cygwin
  pwd := $$(cygpath -m "$$(pwd)")
  translate = $(shell echo '$1' | sed 's/:/;/g')
endif

all: build/main.pdf

# hier Python-Skripte:
build/plotsprecht.pdf: plotsprecht.py matplotlibrc header-matplotlib.tex | build
	TEXINPUTS="$(call translate,$(pwd):)" python plotsprecht.py

build/plotspdrei.pdf: plotspdrei.py matplotlibrc header-matplotlib.tex | build
	TEXINPUTS="$(call translate,$(pwd):)" python plotspdrei.py

build/plotspsaeg.pdf: plotspsaeg.py matplotlibrc header-matplotlib.tex | build
	TEXINPUTS="$(call translate,$(pwd):)" python plotspsaeg.py

# hier weitere Abhängigkeiten für build/main.pdf deklarieren:
build/main.pdf: build/plotsprecht.pdf build/plotspdrei.pdf build/plotspsaeg.pdf lit.bib content/


build/main.pdf: FORCE | build
	  TEXINPUTS="$(call translate,build:)" \
	  BIBINPUTS=build: \
	  max_print_line=1048576 \
	latexmk \
	  --lualatex \
	  --output-directory=build \
	  --interaction=nonstopmode \
	  --halt-on-error \
	main.tex

build:
	mkdir -p build

clean:
	rm -rf build

FORCE:

.PHONY: all clean
