require_relative 'paragraph'
require_relative 'header'
require_relative 'emphasize'
require_relative 'strong'
require_relative 'list'
require_relative 'links'
require_relative 'image'


class Render

  def initialize(text)
    @text = text
  end

  def split_input(text)
    text.split("\n\n")
  end

  def call
    links = links(@text)
    strong = strong(links)
    emphasized = emphasize(strong)
    # image = image(image)
    final = basic_formatting(emphasized.split("\n\n"))
  end

  def basic_formatting(text)
    text.map do |chunk|
      if chunk[0] == "#"
        Header.new(chunk).call
      elsif chunk[0] == "*"
        UnorderedList.new(chunk).call
      elsif chunk[0] == "1"
        OrderedList.new(chunk).call
      else
        Paragraph.new(chunk).call
      end
    end.join("\n")
  end

  def strong(text)
    if text.include?("**")
      Strong.new(text).call
    else
      text
    end
  end

  def emphasize(text)
    if text.include?("*") && text[0] != "*"
      Emphasize.new(text).call
    else
      text
    end
  end

  def links(text)
    if text.include?("](")
      Links.new(text).call
    else
      text
    end
  end
end
