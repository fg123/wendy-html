import html;
import list;

let portrait => (portraitPicture) div(
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
				src(portraitPicture)
			]
		)
	)
);

let cardInfo => (name, skills, items) div(
	styles = [
		"display: table-cell",
		"vertical-align: top"
	],
	content = [
		h1(
			styles = [
				"font-family: 'Roboto Slab', serif",
				"font-size: 48px",
				"letter-spacing: 3px",
				"color: #212121",
				"font-weight: bold",
				"text-transform: uppercase",
				"margin: 0px"
			],
			content = name
		),
		div(
			uniqueId = "description-wrapper",
			styles = ["overflow: hidden"],
			content = [
				div(
					uniqueId = "subnote",
					styles = [
						"font-size: 13px",
						"color: #888"
					],
					content = i(content=skills)
				),
				table(
					uniqueId = "portfolio-description",
					styles = [
						"margin-top: 10px"
					],
					content = map(#:(item)
						tr(
							content = [
								td(
									uniqueId = "icon-wrapper",
									styles = [
										"text-align: center"
									],
									content = [
										i(
											uniqueId = item.icon,
											attributes = [
												ariaHidden("true")
											]
										)
									]
								),
								td(
									content = item.value
								)
							]
						), items)
				)
			]
		)
	]
);

struct CardEntry => (icon, value);

let header => (items) {
	items[items.size - 1].styles += [
		"border-radius: 5px",
		"color: #fff",
		"width: 100px",
		"text-align: center",
		"background-color: #5f89fb"
	];
	items[items.size - 1].id = "blue-btn";
	ret div(
		uniqueId = "header-links",
		styles = [
			"text-align: right",
			"vertical-align: middle",
			"white-space: nowrap",
			"display: none"
		],
		content = p(
			uniqueId = "header-links-inner",
			styles = [
				"margin: 0px"
			],
			content = map(#:(item) span(
				uniqueId = "header-link-wrapper",
				styles = [
					"padding: 5px"
				],
				content = item
			), items)
		)
	)
}

let generateBusinessCard => (name, portraitPicture, skills, cardItems, headerItems)
	div(
		uniqueId = "business-card",
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
		content = [
			portrait(portraitPicture),
			cardInfo(name, skills, cardItems),
			header(headerItems),
			div(
				uniqueId = "dummy-table-element",
				content = "&nbsp;"
			)
		]
	);
