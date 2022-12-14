YEAR := "2022"
DAY := "10"

all: input output version

clean:
	rm input output version

output: solution.nim input
	nim r $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	nim --version > $@
