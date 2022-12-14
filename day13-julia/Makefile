YEAR := "2022"
DAY := "13"

all: input output version

clean:
	rm input output version

output: solution.jl input
	julia solution.jl < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	julia --version > $@
