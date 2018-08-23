SHELL := /bin/bash


all: index.w businessCard.wc html.wc
	wendy index.w
	cp -u static/* gen/

businessCard.wc: businessCard.w html.wc
	wendy -c --optimize businessCard.w

html.wc: html.w
	wendy -c --optimize html.w

