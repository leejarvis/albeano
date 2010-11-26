require File.expand_path('../../lib/albeano', __FILE__)
require 'tempfile'

describe Albeano do

  describe "::generate #to_s/#generate" do
    it "converts [code] blocks into syntax highlighted snippets" do
      Albeano.generate("[code]foo bar[/code]").should == Albino.colorize("foo bar")
    end

    it "trims left/right whitespace from inside [code] tags" do
      Albeano.generate("[code]\n\n foo\nbar\n  [/code]").should == Albino.colorize("foo\nbar")
    end

    it "highlights language specific code" do
      ruby = "[code=ruby]print 'foo bar'[/code]"
      perl = "[code=perl]print 'foo bar'[/code]"
      python = "[code=python]print 'foo bar'[/code]"

      Albeano.generate(ruby).should == Albino.colorize("print 'foo bar'", :ruby)
      Albeano.generate(perl).should == Albino.colorize("print 'foo bar'", :perl)
      Albeano.generate(python).should == Albino.colorize("print 'foo bar'", :python)
    end

    it "highlights multiple code blocks" do
      text = "[code=ruby]print 'foo bar'[/code]"
      text << "[code=perl]print 'foo bar'[/code]"

      Albeano.generate(text).should ==
        Albino.colorize("print 'foo bar'", :ruby) + Albino.colorize("print 'foo bar'", :perl)
    end

    it "excepts a file or string" do
      Tempfile.open("albeano") do |tmp|
        tmp << Albeano.generate("[code]foo bar[/code]")
        tmp.flush
        Albeano.generate(File.new(tmp.path)).should == Albino.colorize("foo bar")
      end
    end

    it "ignores text outside [code] tags" do
      text = "lorem ipsum\n\n"
      text << "[code=ruby]print 'foo bar'[/code]"
      text << "dolor sit amet"

      Albeano.generate(text).should ==
        "lorem ipsum\n\n" + Albino.colorize("print 'foo bar'", :ruby) + "dolor sit amet"
    end

    it "does not highlight snippets with no closing code tag" do
      Albeano.generate("[code]print 'foo bar'").should_not == Albino.colorize("print 'foo bar'")
    end
  end

  describe "to_markdown" do
    it "should return markdown formatted text" do
      Albeano.new("**foo bar**").to_md.should == "<p><strong>foo bar</strong></p>\n"
    end
  end

end