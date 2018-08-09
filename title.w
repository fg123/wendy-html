let title => (attributes, content) {let result = '<title ';for attribute in attributes result += attribute + ' ';result += '>' + content + '</title>';ret result; };
