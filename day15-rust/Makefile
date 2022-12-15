YEAR := "2022"
DAY := "15"

all: input output version

clean:
	rm input output version

output: solution.rs input
	rustc -O solution.rs
	./solution < input | tee $@
	rm solution

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	rustc --version > $@
