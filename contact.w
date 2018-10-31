import html;

let icon => (ic) span(styles = ["padding-right: 5px"], content = i(
    uniqueId = ic,
    attributes = [
        ariaHidden("true")
    ]
));

let iconPair => (content) div(
    uniqueId = "contactIconPair",
    styles = [
        "display: flex",
        "color: #FDFDFD",
        "margin-left: auto",
        "margin-right: auto"
    ],
    content = content
);

let contactInfo = div(
    uniqueId = "contactInfo",
    styles = [
        "display: flex",
        "justify-content: space-between",
        "font-size: 16px",
        cssAppend(
            " a", ["color: #FDFDFD", "text-decoration: none"]
        )
    ],
    content = [
        iconPair(a([icon("fab fa-github"), text("Github")],
            attributes = [href("https://github.com/fg123")])),
        iconPair(a([icon("fas fa-envelope"), text("felix.guo@uwaterloo.ca")],
            attributes = [href("mailto:felix.guo@uwaterloo.ca")])),
        iconPair(a([icon("fab fa-linkedin"), text("LinkedIn")],
            attributes = [href("https://www.linkedin.com/in/felixguo/")]))
    ]
)
