YEAR := "2022"
DAY := "1"

all: input output version

clean:
	rm input output version

output: solution.js input
	node $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	node --version > $@
