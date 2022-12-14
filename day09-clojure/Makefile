YEAR := "2022"
DAY := "9"

all: input output version

clean:
	rm input output version

output: solution.clj input
	bb $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	bb --version > $@
