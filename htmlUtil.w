// Utilities
import stack;
import list;

struct formatted => (text) [build];
formatted.build => (context) {
	"Building Formatted from HTML Util";
	let shouldIgnoreNext = false;
	let tokenStack = stack();
	let tokens = [
		"*", "/", "_"
	];
	let replacements = [
		"b", "i", "u"
	];
	for i in this.text {
		if !shouldIgnoreNext {
			if i == "\\" {
				shouldIgnoreNext = true;
			} else {
				// This logic here is very bad because Wendy has no short
				// circuiting...
				let ended = false;
				if (!tokenStack.empty()) {
					if i ~ tokens and tokenStack.top() == i {
						tokenStack.pop();
						context.html += "</" + replacements[indexOf(tokens, i)] + ">";
						ended = true;
					}
				}
				if i ~ tokens and !ended {
					tokenStack.push(i);
					context.html += "<" + replacements[indexOf(tokens, i)] + ">";
				}
				else if ! (i ~ tokens)
					context.html += i;
			}
		} else {
			shouldIgnoreNext = false;
			context.html += i;
		}
	}
};
