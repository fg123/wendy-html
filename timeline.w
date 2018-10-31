import html;
import list;

struct TimelineItem => (title, date, icon, content);

struct TimelineContainer => (items) [build];

TimelineContainer.build => (context) {
	// Custom Container so we don't inject styles twice
	"Building CSS for TimelineContainer";

	context.html += "<div class='timeline'>";
	let content = [];
	for i in 0->this.items.size {
		let item = this.items[i];
		let leftOrRight = if i % 2 == 0 "left" else "right";
		context.html += "
				<div class='container " + leftOrRight + "'>
					<div class='content'>
						<img src='" + item.icon + "'>
						<h2 style='margin-bottom: 10px'>" + item.title + "</h2>
						<b>" + item.date + "</b>
						<p style='margin-top: 10px'>";
		if (item.content.type == <list>)
			for c in item.content
				c.build(context);
		else
			item.content.build(context);
		context.html += "</p>
					</div>
				</div>";
	}
	context.html += "</div>";
};

let generateTimeline => (items) {
	ret TimelineContainer(items);
};

