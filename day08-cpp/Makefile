YEAR := "2022"
DAY := "8"

all: input output version

clean:
	rm input output version

output: solution.cpp input
	g++ -o solution $<
	./solution < input | tee $@
	rm solution

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	g++ --version > $@
