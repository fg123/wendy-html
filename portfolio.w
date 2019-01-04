import html;
import string;

struct PortfolioItem => (imageUrl, title, subtitle, content, technologies);

let portfolioTagLine => (text) div(
    uniqueId = "portfolioTagLine",
    styles = [
        "width:100%",
        "margin-top: 10px",
        "text-align:right"
    ],
    content = b(
        content = text
    )
)

let portfolioWindow => (portfolioItem) {
    ret div(
        uniqueId = "portfolioWindow",
        styles = [
            "padding-top: 20px",
            "width: calc(100% - 20px)",
            "max-width: 435px",
            "border: 4px solid #f2f2f2",
            "border-radius: 5px",
            "box-shadow: 0 1px 5px #292929",
            "background: #f2f2f2",
            "margin-bottom: 15px",
            "margin-left: auto",
            "margin-right: auto",
            "display: flex",
            "flex-direction: column",
            "justify-content: flex-start",
            "position: relative",
            cssAppend(":before", [
                "content: ' \\25CF \\25CF \\25CF'",
                "font-size: 22px",
                "top: -5px",
                "color: #3d3d3d",
                "position: absolute",
                "z-index: 100",
                "padding-left: 3px"
            ])
        ],
        content = [
            img(
                uniqueId = "portfolioWindowPicture",
                styles = [
                    "width: 100%",
                    "display: block"
                ],
                attributes = [
                    src(portfolioItem.imageUrl),
                    alt(portfolioItem.title)
                ]
            ),
            div(
                uniqueId = "portfolioWindowContentWrapper",
                styles = [
                    "padding: 15px",
                    "display: flex",
                    "flex-direction: column",
                    "justify-content: flex-start",
                    /* Grow to height of parent */
                    "flex-grow: 1",
                    cssAppend(
                        "> div:last-of-type", [
                            "margin-top: auto"
                        ]
                    )
                ],
                content = [
                    h2(
                        uniqueId = "portfolioWindowTitle",
                        styles = [
                            "font-family: 'Roboto Slab', serif",
                            "font-weight: bold",
                            "width: 100%",
                            "margin: 0px"
                        ],
                        content = portfolioItem.title
                    ),
                    div(
                        uniqueId = "portfolioWindowSubtitle",
                        styles = [
                            "font-family: 'Open Sans', sans-serif",
                            "font-size: 13px",
                            "color: #555",
                            "margin: 0px",
                            "font-weight: bold",
                            cssAppend(" a", [
                                "color: #337ab7",
                                "text-decoration: none"
                            ]),
                            cssAppend(" a:hover", [
                                "text-decoration: underline"
                            ])
                        ],
                        content = portfolioItem.subtitle
                    ),
                    div(
                        uniqueId = "portfolioWindowContent",
                        styles = [
                            "padding-top: 10px",
                            "padding-bottom: 10px",
                            "font-family: 'Varela Round', sans-serif",
                            "font-size: 13px",
                            "margin: 0px"
                        ],
                        content = portfolioItem.content
                    ),
                    div(
                        /* Follow Styles from Subtitle */
                        uniqueId = "portfolioWindowSubtitle",
                        content = "Technologies Used: " + (portfolioItem.technologies % ", ")
                    )
                ]
            )
        ]
    );
};

let portfolioRow => (parts) div(
    uniqueId = "portfolioRow",
    styles = [
        "display: grid",
        "grid-template-columns: repeat(auto-fit, minmax(auto, 450px))",
        "justify-content: center"
    ],
    content = parts
);

let generatePortfolio => (items) {
    let windows = map(#:(item) portfolioWindow(item), items);
    let res = [];
    for i in 0->(windows.size / 2) {
        res += portfolioRow([windows[i], windows[i + 1]]);
    }
    if (windows.size % 2 == 1) {
        res += portfolioRow(windows[windows.size - 1]);
    }
    ret portfolioRow(windows);
};
