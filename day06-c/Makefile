YEAR := "2022"
DAY := "6"

all: input output version

clean:
	rm input output version

output: solution.c input
	cc -o solution $<
	./solution < input | tee $@
	rm solution

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	cc --version > $@
