import html;

let headerLink => (loc, c) a(
	content = c,
	uniqueId = "header-link",
	styles = [
		"font-family: 'Nunita Sans', sans-serif",
		"text-decoration: none",
		"display: inline-block",
		"height: 40px",
		"border-radius: 20px",
		"color: #333",
		"font-weight: bold",
		"padding: 12px",
		"font-size: 14px"
	],
	attributes = [href(loc)]
);
