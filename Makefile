SHELL := /bin/bash

all: index.w businessCard.wc html.wc headerLinks.wc section.wc \
moreInfoArrow.wc timeline.wc htmlUtil.wc
	wendy index.w
	cp -uR static/* gen/

businessCard.wc: businessCard.w html.wc
	wendy -c businessCard.w

headerLinks.wc: headerLinks.w html.wc
	wendy -c headerLinks.w

section.wc: section.w html.wc
	wendy -c section.w

moreInfoArrow.wc: moreInfoArrow.w html.wc
	wendy -c moreInfoArrow.w

timeline.wc: timeline.w html.wc
	wendy -c timeline.w

htmlUtil.wc: htmlUtil.w html.wc
	wendy -c htmlUtil.w

html.wc: lib/html.w
	wendy -c lib/html.w
	mv lib/html.wc html.wc

.PHONY: clean all

clean:
	rm -rf *.wc gen/*


