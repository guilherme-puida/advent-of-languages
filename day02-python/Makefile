YEAR := "2022"
DAY := "2"

all: input output version

clean:
	rm input output version

output: solution.py input
	python $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	python --version > $@
