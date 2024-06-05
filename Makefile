dict-gen=python mb-tool/steno_dict.py

programs=rime
scripts=kana ascii_symbol

.PHONY: all clean

all: $(foreach script,$(scripts),$(script)_all)

kana_all: $(foreach program,$(programs),$(program)-kana)

ascii_symbol_all: $(foreach program,$(programs),$(program)-ascii_symbol)

rime-%: build-%
	cat build/$*.tsv | mb-tool/format.sh rime > build/rime-$*.tsv

build-%:
	cat $*/table.tsv | $(dict-gen) $*/system.json $*/chordmap.tsv > build/$*.tsv

clean:
	rm build/*
