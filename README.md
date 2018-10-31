# Wendy - HTML

[wendy](https://github.com/fg123/wendy) needs to be in your path, or discoverable by Make.

Running `make` will create a `gen/` directory that contains the generated HTML.

While I was looking to create a website redesign, I wanted a really simple framework that would let me create components for my website, and separate the data from the HTML semantics. I also wanted to keep the styles for a component with where the component was, instead of writing it in a separate `.css` file. Essentially, I wanted a framework like React or Vue, but they both offer a lot more than I really needed or wanted to package with my static site.

I simply wanted a quick and dirty way to generate HTML with the flexibility of attaching CSS.

This led to the creation of the `lib/html.w` module, which is a WendyScript module that contains an HTML generator.

Imagine a simple component like:
```
<div class="welcomeText">Hello World</div>
```
with corresponding CSS:
```
.welcomeText {
    color: red;
}
```
In WendyHTML, it would look like:
```
div(
    styles = ["color: red"],
    content = "Hello World"
)
```
The content field could subsequently contain more HTML elements.

This simply creates a custom HTML tree which I can then write further functions to parse or simplify in WendyScript.

In the previous example, if no ID or class is specified to the element, WendyHTML would generate a custom unique class name. However, if we were to use that component multiple times, the CSS would be regenerated in multiple entries in the `.css` file. To make it a unique component:
```
div(
    uniqueId = "welcomeComponent",
    styles = ["color: red"],
    content = "Hello World"
)
```

# Why?
Like mentioned before, I was looking for a quick and dirty framework to do some simple HTML generation and component management. However, the extended reason is that I use these larger projects to help debug WendyScript. During the development of this project, I found various obscure bugs with WendyScript, and the completion of this project has increased my confidence in using WendyScript in more projects to come.

This project also demonstrates the usage of compiled WendyScript files in a large project using `Make`.
