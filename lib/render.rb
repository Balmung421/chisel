require_relative 'header'
require_relative 'paragraph'

class Render

  def initialize(text)
    @text = text
  end

  def split_input(text)
    text.split("\n\n")
  end

  def call

  end

end
