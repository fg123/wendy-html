import tags

let NEWLINE = false;

// Special operator for concat
let <string> * <string> => (lhs, rhs)
	ret if (NEWLINE and lhs.size > 0 and rhs.size > 0)
		lhs + "\n" + rhs
	else lhs + rhs

let html => (head, body)
	"<!-- Generated with WendyHTML -->" *
	"<!DOCTYPE HTML>" *
	"<html>" *
	head *
	body *
	"</html>";

let head => (title, styles, scripts, content) {
	let result = "<head>" * title;
	for script in scripts
		result = result * 
			"<script type='text/javascript' src='" + script + "' />";
	for style in styles
		result = result * 
		"<link rel='stylesheet' type='text/css' href='" + style + "' />";
	result = result * content * "</head>";
	ret result;
};


let body => (content) {
	ret "<body>" * content * "</body>";
};

let stylesheets => (lst) lst;
let scripts => (lst) lst;
