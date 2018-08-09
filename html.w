/* HTML MODULE */

// This is for generating class ids.
let globalID = 0;

let styles => (/* varargs */) {
	ret arguments;
};

// Context stores the generation.
struct Context => (html, css, indentation, stub, alreadyGeneratedCss);
Context.init => (stub) {
	this.stub = stub;
	this.html = "";
	this.css = "";
	this.indentation = 0;
	this.alreadyGeneratedCss = [];
	ret this;
};

let createAttributeStruct => (name) {
	struct aStruct => (value) [generateString];
	aStruct.generateString => () ret name + "='" + value + "'";
	ret aStruct;
};

let createHTMLStruct => (tagName) {
	struct structz => (styles, content, id, attributes) [build];
	structz.init => (styles = [], content = "", uniqueId = none, attributes = []) {
		if uniqueId == none {
			this.id = tagName + globalID;
			inc globalID;
		}
		else
			this.id = uniqueId;

		this.styles = styles;
		this.content = content;
		this.attributes = attributes;
		ret this;
	};

	structz.build => (context) {
		let tag = "<" + tagName + ":" + this.id + ">";
		"Building CSS for " + tag;

		if !(this.id ~ context.alreadyGeneratedCss) {
			context.alreadyGeneratedCss += this.id;
			context.css += "." + this.id + " {\n";
			for style in this.styles
				// Automatically append semi-colon too!
				context.css += style + ";\n";
			context.css += "}\n\n";
		}

		"Building HTML for " + tag;
		let attributesString = "";
		for attribute in this.attributes
			attributesString += " " + attribute.generateString();

		let indentation = context.indentation * "\t";
		let front = "<" + tagName +
			" class='" + this.id + "'" +
			" id='" + this.id + "'" +
			attributesString + ">";

		let back = "</" + tagName + ">";
		if (this.content.type == <string> or this.content.type == <number>)
			context.html += indentation + front + this.content + back + "\n";
		else {
			context.html += indentation + front + "\n";
			inc context.indentation;
			if (this.content.type == <list>) {
				for c in this.content
					c.build(context);
			}
			else {
				this.content.build(context);
			}
			dec context.indentation;
			context.html += indentation + back + "\n";
		}
		ret;
	};
	ret structz;
};

struct html => (title, stylesheets, scripts, content) [build];

html.build => (context) {
	"Building <html>";
	context.html += "<!-- Generated with WendyHTML -->\n";
	context.html += "<!DOCTYPE HTML>\n";
	context.html += "<html>\n";
	context.html += "<head>\n";
	context.html += "	<title>" + this.title + "</title>\n";
	for script in this.scripts
		context.html +=
			"	<script type='text/javascript' src='" + script + "' />\n";
	for style in this.stylesheets
		context.html +=
			"	<link rel='stylesheet' type='text/css' href='" + style + "' />\n";
	context.html +=
		"	<link rel='stylesheet' type='text/css' href='" + context.stub + ".css' />\n";
	context.html += "</head>\n";
	context.html += "<body>\n";
	inc context.indentation;
	for c in this.content
		c.build(context);
	dec context.indentation;
	context.html += "</body>\n";
	context.html += "</html>\n";
};

let div = createHTMLStruct("div");
let span = createHTMLStruct("span");
let p = createHTMLStruct("p");
let img = createHTMLStruct("img");

let src = createAttributeStruct("src");

import io;
import system;
let generate => (stub, html) {
	let context = Context(stub);
	"Building Wendy HTML...";
	html.build(context);
	"Writing to Files...";
	let exit = System.exec("mkdir -p gen");
	io.writeFile("gen/" + stub + ".html", context.html);
	io.writeFile("gen/" + stub + ".css", context.css);
	"Done!";
};
