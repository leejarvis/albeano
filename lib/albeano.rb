require 'albino'

class Albeano
  VERSION = '1.0.0'

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

  # @return [String] Newly generated Albino markup
  def generate
    @text.gsub(/\[code(?:=(.+?))?\]\s*(.+?)\s*\[\/code\]/m) do
      Albino.colorize($2, $1 || :text)
    end
  end

  alias :to_s :generate

  # @raise [LoadError] Raised when unable to load RDiscount
  # @return [String] The newly generated markup
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