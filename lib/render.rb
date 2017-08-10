require_relative 'paragraph'
require_relative 'header'

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
