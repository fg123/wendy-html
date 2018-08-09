import html;
import string;
import list;

let googleFont => (fontName) {
	fontName = (fontName / " ") % "+";
	ret "//fonts.googleapis.com/css?family=" + fontName;
};

NEWLINE = true;

let businessCard = div(
	[
		id("business-card")
	],
	""
);

let sections = [

];

let mainBody = businessCard + sum(sections);

html(
	head(
		title("Felix Guo"),
		stylesheets([
			googleFont("Roboto Slab"),
			googleFont("Nunito Sans"),
			googleFont("Varela Round"),
			"main.css",
			"animate.min.css",
			"https://use.fontawesome.com/releases/v5.0.13/css/all.css"
		]),
		scripts([
		
		]),
		""
	),
	body(mainBody)
);
