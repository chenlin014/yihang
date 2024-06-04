dict-gen=python mb-tool/steno_dict.py

programs=rime
scripts=kana

.PHONY: all clean

all: $(foreach script,$(scripts),$(script)_all)

kana_all: $(foreach program,$(programs),$(program)-kana)

rime-%: build-%
	cat build/$*.tsv | mb-tool/format.sh rime > build/rime-$*.tsv

build-%:
	cat $*/table.tsv | $(dict-gen) $*/system.json $*/chordmap.tsv > build/$*.tsv

clean:
	rm build/*
