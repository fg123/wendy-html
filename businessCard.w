import html;

let businessCard = div(
	uniqueId = "businessCard",
	styles = [
		"display: table",
		"background: #fff",
		"width: 700px",
		"height: auto",
		"padding: 20px",
		"position: absolute",
		"top: 50%",
		"left: 50%",
		"transform: translate(-50%, -50%)",
		"box-shadow: 0px 0px 20px 1px #000",
		"border-radius: 5px",
		"z-index: 500"
	],
	content = div(
		styles = [
			"display: table-cell",
			"vertical-align: baseline"
		],
		content = div(
			uniqueId = "portrait",
			styles = [
				"width: 220px",
				"height: 220px",
				"overflow: hidden",
				"display: inline-block",
				"margin-right: 20px"
			],
			content = img(
				styles = [
					"height: inherit",
					"width: inherit",
					"object-fit: cover",
					"border-radius: 10px"
				],
				attributes = [
					src("portrait.png")
				]
			)
		)
	)
);
