import html;

let moreInfoArrow = div(
	uniqueId = "more-info",
	styles = [
		"text-align: center",
		"position: absolute",
		"bottom: 25px",
		"left: 0",
		"right: 0",
		"margin-left: auto",
		"margin-right: auto",
		"width: 100px",
		"text-transform: uppercase",
		"z-index: 5",
		"color: #FDFDFD"
	],
	content = [
		text("More Info"),
		br(),
		i(
			uniqueId = "fa fa-chevron-down fa-fw",
			attributes = [
				ariaHidden("true")
			]
		)
	]
)
