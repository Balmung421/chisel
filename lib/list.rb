class List

  def initialize(text)
    @text = text
  end

  def split_lines
    @text.split("\n")
  end

  def strip_markdown
    split_lines.map {|line| line[2..-1].strip }
  end

  def wrap_in_tags
    strip_markdown.map {|line| "  <li>#{line}</li>"}
  end

  def formatted_text
    wrap_in_tags.join("\n")
  end
end


class OrderedList < List

  def call
    "<ol>\n#{formatted_text}\n</ol>\n"
  end
end

class UnorderedList < List

  def call
    "<ul>\n#{formatted_text}\n</ul>\n"
  end
end

# class List
#   def ul_replacer(string)
#     "<ul>\n" + string.gsub(/\* (.+)/, "<li>\\1</li>") + "\n</ul>\n"
#   end
#
#   def ol_replacer(string)
#     "<ol>\n" + string.gsub(/^\d+\. (.+)/, "<li>\\1</li>") + "\n</ol>\n"
#   end
# end
