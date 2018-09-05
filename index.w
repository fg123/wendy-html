import html;
import businessCard;
import section;
import string;
import headerLinks;
import moreInfoArrow;
import timeline;
import htmlUtil;

let googleFont => (fontName) {
	fontName = (fontName / " ") % "+";
	ret "//fonts.googleapis.com/css?family=" + fontName;
};

let name = "Felix Guo";
let portraitUrl = "portrait.png";
let skills = "C, C++, Java, Kotlin, Python, HTML5, CSS, Javascript";
let cardItems = [
	CardEntry("fas fa-graduation-cap", "Computer Science and Business Administration"),
	CardEntry("fas fa-map-marker", "University of Waterloo"),
	CardEntry("fas fa-building", "Google LLC."),
	CardEntry("fas fa-file-alt", a(
			content = "Resume",
			attributes = [href("FelixGuoResume.pdf")]
		)
	),
	CardEntry("fab fa-github", a(
			content = "Github",
			attributes = [href("https://github.com/fg123")]
		)
	),
	CardEntry("fas fa-envelope", a(
			content = "felix.guo@uwaterloo.ca",
			attributes = [href("mailto:felix.guo@uwaterloo.ca")]
		)
	)
];

let headerLinks = [
	headerLink("#tech-specs", "Overview"),
	headerLink("#tech-specs", "Experience"),
	headerLink("#tech-specs", "Portfolio"),
	a(
		uniqueId = "blue-btn",
		content = "Contact",
		styles = [
			"border-radius: 5px",
			"color: #fff",
			"width: 100px",
			"text-align: center",
			"background-color: #5f89fb"
		],
		attributes = [href("#tech-specs")]
	)
];

let timelineItems = [
	TimelineItem("Inkpad Studios", "Nov 2014 - June 2016", "corners/inkpad-tr.png", [
		text("Developed from ground up a fun Android game called Pedal Panic "),
		a(attributes = [href("https://play.google.com/store/apps/details?id=ca.inkpadstudios.pedalpanic&hl=en")]),
		text(" using"), b("Unity"), text(" and "), b("C#"), text(".")
	]),
	TimelineItem("Yahoo! Inc", "May - Aug 2017", "corners/yahoo-tr.png",
	formatted("Worked on creating custom *Android* folding animations for new advertisement layouts using /Java/."))
];

let businessCard = generateBusinessCard(name, portraitUrl, skills, cardItems, headerLinks);
struct sectionHeader => (text) [build];
sectionHeader.build => (context) {
	h1(uniqueId = "section-header",
		content = this.text,
		styles = [
			"margin-left: auto",
			"margin-right: auto",
			"text-align: center",
			"color: #fff"
		]).build(context);
};

let sections = [
	generateSection(true, false, [businessCard, moreInfoArrow], [
		"background: url(vancouver.jpg) no-repeat center center",
		"background-size: cover;"
	]),
	generateSection(false, true, [sectionHeader("Experience"), generateTimeline(timelineItems)], [
		"background: url(googleBuilding.jpg) no-repeat center center",
		"background-size: cover;"
	])
];

generate(
	"index",
	html(
		title = name,
		stylesheets = [
			googleFont("Roboto Slab"),
			googleFont("Nunito Sans"),
			googleFont("Varela Round"),
			googleFont("Raleway"),
			"main.css",
			"https://use.fontawesome.com/releases/v5.0.13/css/all.css",
			"animate.min.css",
			"timeline.css"
		],
		scripts = [
			"main.js"
		],
		content = sections
	)
);
