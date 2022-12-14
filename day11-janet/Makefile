YEAR := "2022"
DAY := "11"

all: input output version

clean:
	rm input output version

output: solution.janet input
	janet solution.janet < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	janet -v > $@
