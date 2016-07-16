.PHONY: all
all:
	R -e "devtools::document()"
	R CMD INSTALL .
