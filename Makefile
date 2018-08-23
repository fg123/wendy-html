SHELL := /bin/bash


all: index.w businessCard.wc html.wc
	wendy index.w
	cp -u static/* gen/

businessCard.wc: businessCard.w html.wc
	wendy -c --optimize businessCard.w

html.wc: lib/html.w
	wendy -c --optimize lib/html.w
	mv lib/html.wc html.wc

.PHONY: clean all

clean:
	rm -rf *.wc gen/*


