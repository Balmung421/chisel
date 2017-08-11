class Header

  def initialize(text)
    @text = text
    @words = @text.split
  end

  def call
    rendered_with_heading_tags
  end

  def rendered_with_heading_tags
    "<h#{counter}>#{stripped_of_markdown}</h#{counter}>"
  end

  def counter
    @counter ||= @words.first.count("#")
  end

  def stripped_of_markdown
    @words.shift
    @words.join(" ")
  end
end
