SHELL := /bin/bash

all: index.w businessCard.wc html.wc headerLinks.wc section.wc \
moreInfoArrow.wc timeline.wc htmlUtil.wc portfolio.wc contact.wc
	wendy index.w
	cp -uR static/* gen/

%.wc: %.w html.wc
	wendy -c $<

html.wc: lib/html.w
	wendy -c lib/html.w
	mv lib/html.wc html.wc

.PHONY: clean all

clean:
	rm -rf *.wc gen/*


