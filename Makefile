SHELL := /bin/bash

all: genPage

genPage: test.w html
	wendy test.w > test.html

tags.w: tagGenerator.w
	wendy tagGenerator.w > tags.w

tags: tags.w
	wendy -c tags.w

html: tags html.w
	wendy -c html.w

