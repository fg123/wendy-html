import html;
import businessCard;
import string;

let googleFont => (fontName) {
	fontName = (fontName / " ") % "+";
	ret "//fonts.googleapis.com/css?family=" + fontName;
};

generate(
	"index",
	html(
		title = "Felix Guo",
		stylesheets = [
			googleFont("Roboto Slab"),
			googleFont("Nunito Sans"),
			googleFont("Varela Round"),
			"main.css",
			"https://use.fontawesome.com/releases/v5.0.13/css/all.css"
		],
		scripts = [],
		content = [businessCard]
	)
);
