import html;
import businessCard;
import string;

let googleFont => (fontName) {
	fontName = (fontName / " ") % "+";
	ret "//fonts.googleapis.com/css?family=" + fontName;
};

let name = "Felix Guo";
let portraitUrl = "portrait.jpg";
let skills = "C, C++, Java, Kotlin, Python, HTML5, CSS, Javascript";
let cardItems = [
	CardEntry("fas fa-graduation-cap", "Computer Science and Business Administration"),
	CardEntry("fas fa-map-marker", "University of Waterloo"),
	CardEntry("fas fa-building", "Open to Internships Sept 2019 - Dec 2019"),
	CardEntry("fas fa-file-alt", "Resume"),
	CardEntry("fab fa-github", "Github"),
	CardEntry("fas fa-envelope", "felix.guo@uwaterloo.ca")
];

generate(
	"index",
	html(
		title = name,
		stylesheets = [
			googleFont("Roboto Slab"),
			googleFont("Nunito Sans"),
			googleFont("Varela Round"),
			"main.css",
			"https://use.fontawesome.com/releases/v5.0.13/css/all.css"
		],
		scripts = [],
		content = [businessCard(name, portraitUrl, skills, cardItems)]
	)
);
