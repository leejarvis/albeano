Albeano
=======

Installation
------------

You need to ensure you have [Pygments](http://pygments.org/) syntax highlighter
installed on your system and your application has access to the `pygmentize`
executable. Then it's as easy as:

    gem install albeano

Usage
-----

Albeano takes your orginal text and strips out the `[code]` style snippets
producing a nicely formatted document with HTML syntax highlighted code inserts.
Perfect for embedding code into blog posts.


    Albeano.generate(text)
    Albeano.generate(File.new(path_to_file))

You can even have it return markdown. Just make sure you have
[RDiscount](https://github.com/rtomayko/rdiscount) installed

    Albeano.new(text).to_markdown
    Albeano.new(text).to_markdown(:smart, :filter_html)
