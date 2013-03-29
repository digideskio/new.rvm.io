## Page configurations

* __jumbotron\_as\_phrase__: [true|false] - Jumbotron sub-text as h2 or p.
* __nav__: [false|String] - Hide from main nav or custom nav title.
* __dropdown__: [true|false] - Enable or disable main nav sub discovery.
* __toc__: [true|false] - Enable or disable toc sidebar on content pages.

## Content organization

* All command docs should go under docs/cmd-name
  * Sub-commands should go under docs/cmd-name/sub-cmd
  * Sub-commands will be automatically linked into the bottom of the page.
* Tutorials for stuff like Passenger should go under getting-started/advanced/tutorial
  * Optionally we can just create a whole new tutorials/ section
* The examples folder should hold logically organized code examples for pages.
  * A page can hold any number of examples, each as it's own .txt file.
  * These code examples are not page constrained, just logically organized by page.
