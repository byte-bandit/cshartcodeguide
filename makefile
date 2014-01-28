DOCUMENT_NAME = codingconventions
OUTPUT_DIR    = output

# Build the LaTeX document.
all: outputdir report cleanup show

#will use NOHUP for showing in evince
allhiden: outputdir report cleanup stealth

# Remove output directory.
clean:
	rm -rf $(OUTPUT_DIR)

# cleanup tempfiles
cleanup:
	rm -f $(DOCUMENT_NAME).aux $(DOCUMENT_NAME).acn $(DOCUMENT_NAME).glo $(DOCUMENT_NAME).ist $(DOCUMENT_NAME).lof $(DOCUMENT_NAME).lot $(DOCUMENT_NAME).lol $(DOCUMENT_NAME).out $(DOCUMENT_NAME).toc $(DOCUMENT_NAME).alg $(DOCUMENT_NAME).glg $(DOCUMENT_NAME).gls $(DOCUMENT_NAME).acr $(DOCUMENT_NAME).pdf $(DOCUMENT_NAME).blg $(DOCUMENT_NAME).bbl

# Create LaTeX output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# Generate PDF output from LaTeX input files.
report:
	pdflatex -interaction=errorstopmode -synctex=1 $(DOCUMENT_NAME)
	cp $(DOCUMENT_NAME).pdf $(OUTPUT_DIR)

# Open evince to show the PDF File
show:
	evince $(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf

stealth:
	evince $(OUTPUT_DIR)/$(DOCUMENT_NAME).pdf &
