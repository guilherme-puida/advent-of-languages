YEAR := "2022"
DAY := "5"

all: input output version

clean:
	rm input output version

output: solution.cr input
	crystal run $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	crystal --version > $@
