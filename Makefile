
all: test-A/out.tsv dev-0/out.tsv

%/out.tsv: %/hyp.tsv %/gold.tsv
	geval --alt-metric BLEU --line-by-line -i $*/hyp.tsv -o $*/hyp.tsv -e $*/gold.tsv | cut -f 1 > $@

%/hyp.tsv: %/in.tsv
	cut -f 1 < $< > $@

%/gold.tsv: %/in.tsv
	cut -f 3 < $< > $@

clean:
	rm -rf */out.tsv
