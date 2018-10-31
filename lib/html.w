/* HTML MODULE */

// This is for generating class ids.
let globalID = 0;

/* CSS Modifiers */
struct cssAppend => (appendSelector, styles);

// Context stores the generation.
struct Context => (html, css, indentation, stub, alreadyGeneratedCss, isMinified, isInline);
Context.init => (stub, isMinified) {
	this.stub = stub;
	this.html = "";
	this.css = "";
	this.indentation = 0;
	this.alreadyGeneratedCss = [];
    this.isMinified = isMinified;
    this.isInline = false;
	ret this;
};

let createAttributeStruct => (name) {
	struct aStruct => (value) [generateString];
	aStruct.generateString => () ret name + "='" + this.value + "'";
	ret aStruct;
};

struct inline => (content) [build];

inline.build => (context) {
    context.isInline = true;
    for c in this.content
        c.build(context);
    context.isInline = false;
};

let createHTMLStruct => (tagName) {
	struct structz => (styles, content, id, attributes) [build];
	structz.init => (content = "", styles = [], uniqueId = none, attributes = []) {
		this.id = uniqueId;

		this.styles = styles;
		this.content = content;
		this.attributes = attributes;
		ret this;
	};

	structz.build => (context) {
		let possibleId = this.id;
		if possibleId == none {
			possibleId = tagName + globalID;
			inc globalID;
		}
		let tag = "<" + tagName + ":" + possibleId + ">";
		"Building CSS for " + tag;

		if !(possibleId ~ context.alreadyGeneratedCss) and this.styles.size > 0 {
            let appends = [];
			context.alreadyGeneratedCss += possibleId;
			context.css += "." + possibleId + " {";
            if (!context.isMinified) {
                context.css += "\n";
            }
			for style in this.styles {
				// Automatically append semi-colon too!
                if (style.type == <string>) {
                    if (!context.isMinified) {
                        context.css += "\t";
                    }
				    context.css += style + ";";
                    if (!context.isMinified) {
                        context.css += "\n";
                    }
                } else if (style.type == <cssAppend>) {
                    appends += style;
                }
            }
			context.css += "}";
            if (!context.isMinified) {
                context.css += "\n\n";
            }
            for append in appends {
                context.css += "." + possibleId + append.appendSelector + " {";
                if (!context.isMinified) {
                    context.css += "\n";
                }
                for style in append.styles {
                    // Automatically append semi-colon too!
                    if (style.type == <string>) {
                        if (!context.isMinified) {
                            context.css += "\t";
                        }
                        context.css += style + ";";
                        if (!context.isMinified) {
                            context.css += "\n";
                        }
                    }
                }
                context.css += "}";
                if (!context.isMinified) {
                    context.css += "\n\n";
                }
            }
		}

		"Building HTML for " + tag;
		let attributesString = "";
		for attribute in this.attributes
			attributesString += " " + attribute.generateString();

		let indentation = if (context.isMinified) "" else context.indentation * "\t";
		let identification = "";
		if this.styles.size > 0 or this.id != none {
			identification = " class='" + possibleId + "'" +
			" id='" + possibleId + "'";
		}
		let front = "<" + tagName + identification +
			attributesString + ">";

		let back = "</" + tagName + ">";
		if (this.content.type == <string> or this.content.type == <number>) {
			context.html += indentation + front + this.content + back;
            if (!context.isMinified and !context.isInline) {
                context.html += "\n";
            }
        }
		else {
			context.html += indentation + front;
            if (!context.isMinified and !context.isInline) {
                context.html += "\n";
            }
			inc context.indentation;
			if (this.content.type == <list>) {
				for c in this.content
					c.build(context);
			}
			else {
				this.content.build(context);
			}
			dec context.indentation;
			context.html += indentation + back;
            if (!context.isMinified and !context.isInline) {
                context.html += "\n";
            }
		}
		ret;
	};
	ret structz;
};

struct meta => (name, content);
struct html => (title, stylesheets, metas, favicon, scripts, content) [build];

html.build => (context) {
	"Building <html>";
	context.html += "<!-- Generated with WendyHTML -->\n";
    context.html += "<!-- https://github.com/fg123/wendy-html -->\n";
	context.html += "<!DOCTYPE HTML>\n";
	context.html += "<html>\n";
	context.html += "<head>\n";
	context.html += "    <title>" + this.title + "</title>\n";
    context.html += "    <meta charset='utf-8'>";
    for m in this.metas
        context.html += "   <meta name='" + m.name + "' content='" + m.content + "'>";
	context.html += "	<link rel='icon' type='image/png' href='" + this.favicon + "'>\n";
	for style in this.stylesheets
		context.html += "	<link rel='stylesheet' type='text/css' href='" + style + "' />\n";
	context.html +=
		"	<link rel='stylesheet' type='text/css' href='" + context.stub + ".css' />\n";
	context.html += "</head>\n";
	context.html += "<body>\n";
	inc context.indentation;
	for c in this.content
		c.build(context);
	dec context.indentation;
	for script in this.scripts
		context.html += "<script src='" + script + "'></script>\n";
	context.html += "</body>\n";
	context.html += "</html>\n";
};

let div = createHTMLStruct("div");
let span = createHTMLStruct("span");
let p = createHTMLStruct("p");
let img = createHTMLStruct("img");
let h1 = createHTMLStruct("h1");
let h2 = createHTMLStruct("h2");
let h3 = createHTMLStruct("h3");
let h4 = createHTMLStruct("h4");
let h5 = createHTMLStruct("h5");
let h6 = createHTMLStruct("h6");
let table = createHTMLStruct("table");
let tr = createHTMLStruct("tr");
let td = createHTMLStruct("td");
let b = createHTMLStruct("b");
let i = createHTMLStruct("i");
let a = createHTMLStruct("a");
struct br => [build];
br.build => (context) {
	context.html += "<br>\n";
};

// Text Node
struct text => (text) [build];
text.build => (context) {
	context.html += this.text;
};

let src = createAttributeStruct("src");
let alt = createAttributeStruct("alt");
let href = createAttributeStruct("href");
let ariaHidden = createAttributeStruct("aria-hidden");

import io;
import system;
let generate => (stub, html, minify) {
	let context = Context(stub, minify);
	"Building Wendy HTML...";
	html.build(context);
	"Writing to Files...";
	let exit = System.exec("mkdir -p gen");
	io.writeFile("gen/" + stub + ".html", context.html);
	io.writeFile("gen/" + stub + ".css", context.css);
	"Done!";
};
