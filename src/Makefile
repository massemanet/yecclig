## -*- mode: Makefile; fill-column: 80; comment-column: 67; -*-

.PHONY: all

STEMS = yecclig yecclig_lexer yecclig_parser \
txt txt_scanner txt_parser

BEAMS = $(patsubst %, $(EBIN)/%.beam, $(STEMS))

EBIN = ../ebin

all: $(BEAMS)

$(EBIN):
	mkdir $(EBIN)

$(EBIN)/%.beam: %.erl
	erlc -o $(EBIN) $<

%.erl: %.xrl
	erlc $<

%.erl: %.yrl
	erlc $<
