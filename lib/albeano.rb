require 'albino'

class Albeano

  def self.generate(text)
    new(text).generate
  end

  def initialize(text)
    if text.respond_to?(:read)
      @text = text.read
    else
      @text = text
    end
    @markdown = nil
  end

  def generate
    @text.gsub(/\[code(?:=(.+?))?\]\s*(.+?)\s*\[\/code\]/m) do
      if $1
        Albino.colorize($2, $1)
      else
        Albino.colorize($2)
      end
    end
  end

  def to_markdown(*extensions)
    begin
      require 'rdiscount'
    rescue LoadError
      raise "Albeano requires RDiscount to render markdown"
    end

    @markdown ||= RDiscount.new(generate).to_html
  end

  alias :to_md :to_markdown

end