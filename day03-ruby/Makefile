YEAR := "2022"
DAY := "3"

all: input output version

clean:
	rm input output version

output: solution.rb input
	ruby $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	ruby --version > $@
