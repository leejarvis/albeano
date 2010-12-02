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

### Rails 3

You can easily incorporate Albeano into your existing Rails applications, just
add `albeano` to your Gemfile.

You can then add a method do your models (assuming `body` contains the
body of your post or text):

    class Post < ActiveRecord::Base
      def content
        Albeano.generate(body)
      end

      # with markdown
      def content
        Albeano.new(body).to_markdown
      end
    end

You can of course use these methods inside of your views, too. Remember to
use the `html_safe` method before rendering your markup, otherwise your HTML
will be escaped and rendered as entities.