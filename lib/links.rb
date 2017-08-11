class Links

  attr_reader :open_bracket, :close_bracket, :open_paren, :close_paren

  def initialize(text)
    @text = text
    @open_bracket = @text.index("[")
    @close_bracket = @text.index("]")
    @open_paren = @text.index("(")
    @close_paren = @text.index(")")
  end

  def call
    link_text = get_link_text(open_bracket, close_bracket)
    paren_content = get_paren_content(open_paren, close_paren)
    paren_parts = paren_content.split(" ")
    href_text = paren_parts.first
    title_text = get_title_text(paren_parts)
    output = to_html(link_text, href_text, title_text)
    final_output = insert_formatted_link(open_bracket, close_paren, output)
  end

  def to_html(link_text, href_text, title_text = "")
    if title_text.empty?
      "<a href=\"#{href_text}\">#{link_text}</a>"
    else
      "<a href=\"#{href_text}\" title=\"#{title_text}\">#{link_text}</a>"
    end
  end

  def get_link_text(open, close)
    @text[open + 1...close]
  end

  def get_paren_content(open, close)
    @text[open + 1...close]
  end

  def get_title_text(paren_parts)
    paren_parts.count == 1 ? "" : paren_parts.last.delete("\"")
  end

  def insert_formatted_link(open, close, output)
    @text[open..close] = ""
    @text.insert(open, output)
  end
end
