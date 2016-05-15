#export SHELL = /bin/bash -xe
export CONVERTER = /usr/bin/uniconvertor

SVGS = $(wildcard *.svg)
OUTPUTS = $(SVGS:%.svg=export/%.ai)

default: all
.PHONY: all
all: info build

help:
	## convert from SVG to AI
	##
	## build, default: convert *svg to export/*ai
	##
	## clean: remove exports dir

.PHONY: info
info:
	$(info SVGS is $(SVGS))
	$(info OUTPUTS is $(OUTPUTS))

export:
	mkdir -p export

.PHONY: clean
clean:
	rm -r export

build: $(OUTPUTS)

export/%.ai: %.svg export
	$(CONVERTER) $< $@


