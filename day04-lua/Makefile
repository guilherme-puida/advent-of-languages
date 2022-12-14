YEAR := "2022"
DAY := "4"

all: input output version

clean:
	rm input output version

output: solution.lua input
	lua $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	lua -v > $@
