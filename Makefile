build-page: all
	python build-page.py
	
html:
	python build-page.py

all:
	./run.sh
	
clean:
	rm -rf dist
