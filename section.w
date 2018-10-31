import html;

struct offsetAnchor => (id) [build];
offsetAnchor.build => (context) {
    context.html += "<a id='" + this.id + "' class='anchor'></a>";
};

let generateSection => (
    anchor = "",
	isFixedHeight = false,
	withContentWrapper = true,
	content = [],
	styles = []
) {
	let actualStyles = [
		"width: 100%",
		"z-index: -10",
		"overflow-x: hidden"
	] + styles;

    content = offsetAnchor(anchor) + content;
	if isFixedHeight
		actualStyles += "height: 100%";

	ret div(
        styles = actualStyles,
        content = if withContentWrapper div(
            uniqueId = "content-wrapper",
            styles = [
                "position: relative",
                "max-width: 900px",
                "margin: 0 auto",
                "padding-top: 30px",
                "padding-bottom: 30px"
            ],
            content = content
        ) else content
    );
};
