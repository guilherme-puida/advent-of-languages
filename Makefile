DAYS := $(wildcard day*)
STATIC := $(wildcard static/*)
PARTIALS := $(wildcard partials/*)

.PHONY: build-page all clean

build-page: all $(STATIC) $(PARTIALS)
	python build-page.py

all: $(wildcard day*)

clean:
	rm -rf dist

$(DAYS): $(wildcard $@/*)
	cd $@ && $(MAKE)
