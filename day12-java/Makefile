YEAR := "2022"
DAY := "12"

all: input output version

clean:
	rm input output version

output: solution.java input
	javac $<
	java solution < input | tee $@
	rm *.class

input:
	../download.sh $(YEAR) $(DAY) > $@

version:
	javac --version > $@
	java --version >> $@
