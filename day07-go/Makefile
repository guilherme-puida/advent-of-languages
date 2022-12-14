YEAR := "2022"
DAY := "7"

all: input output version

clean:
	rm input output version

output: solution.go input
	go run $< < input | tee $@

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	go version > $@
