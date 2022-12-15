YEAR := "2022"
DAY := "14"

all: input output version

clean:
	rm input output version

output: solution.dart input
	dart run $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	dart --version > $@
