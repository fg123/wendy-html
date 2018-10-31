import html;

let sharedProp = [
    "font-family: 'Nunita Sans', sans-serif",
    "text-decoration: none",
    "display: inline-block",
    "height: 40px",
    "font-weight: bold",
    "padding: 12px",
    "font-size: 14px"
];

let headerLink => (loc, c) a(
	content = c,
	uniqueId = "header-link",
	styles = sharedProp + [
		"border-radius: 20px",
		"color: #333",
        cssAppend(".active", [
            "box-shadow: 0 0 15px #666666"
        ]),
        cssAppend(".active:hover", [
            "text-decoration: none",
            "color: #333"
        ]),
        cssAppend(":not(.active):hover", [
            "text-decoration: none",
            "background-color: #EEE",
            "color: #333"
        ])
	],
	attributes = [href(loc)]
);

let blueHeaderLink => (loc, c) a(
    content = c,
    uniqueId = "blue-btn",
    styles = sharedProp + [
        "border-radius: 5px",
		"color: #FDFDFD",
		"width: 100px",
		"text-align: center",
		"background-color: #5f89fb",
        cssAppend(":hover", [
            "text-decoration: none",
		    "color: #FDFDFD",
            "background-color: #4c70ce"
        ])
    ],
	attributes = [href(loc)]
);
