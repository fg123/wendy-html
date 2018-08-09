let generateAttribute => (name)
	"let " + name + " => (value) '" + name + "=\"' + value + '\"';";

let generateTag => (name, hasAttribute) {
	let attr = if hasAttribute "attributes, " else "";
	
	let result = "let " + name + " => (" + attr + "content) {\n";
	result += "let result = '<" + name + "';\n";
	if hasAttribute {
		result += "if attributes.size > 0 result += ' '";
		result += "for attribute in attributes \n";
		result += "result += attribute + ' ';\n";
	}
	result += "result += '>' + content + '</" + name + ">';\n";
	result += "ret result; };\n";
	ret result;
};

let tagsAttr = [
	"div",
	"span",
	"p"
];

let tagsNoAttr = ["title"];

for tag in tagsAttr generateTag(tag, true);
for tag in tagsNoAttr generateTag(tag, false);

generateAttribute("id");
