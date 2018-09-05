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
				if (!tokenStack.empty()) {
					if i ~ tokens and tokenStack.top() == i {
						tokenStack.pop();
						context.html += "</" + replacements[indexOf(tokens, i)] + ">";
					}
				}
				if i ~ tokens {
					tokenStack.push(i);
					context.html += "<" + replacements[indexOf(tokens, i)] + ">";
				}
				else
					context.html += i;
			}
		} else {
			shouldIgnoreNext = false;
			context.html += i;
		}
	}
};
