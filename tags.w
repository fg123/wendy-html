let div => (attributes, content) {
let result = '<div';
if attributes.size > 0 result += ' 'for attribute in attributes 
result += attribute + ' ';
result += '>' + content + '</div>';
ret result; };

let span => (attributes, content) {
let result = '<span';
if attributes.size > 0 result += ' 'for attribute in attributes 
result += attribute + ' ';
result += '>' + content + '</span>';
ret result; };

let p => (attributes, content) {
let result = '<p';
if attributes.size > 0 result += ' 'for attribute in attributes 
result += attribute + ' ';
result += '>' + content + '</p>';
ret result; };

let title => (content) {
let result = '<title';
result += '>' + content + '</title>';
ret result; };

let id => (value) 'id="' + value + '"';
