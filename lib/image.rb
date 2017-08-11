# class Image
#
#   def initialize(text)
#     @text = text
#   end
#
#   def split_lines
#     @text.split("\n")
#   end
#
#   def strip_markdown
#     split_lines.map {|line| line[2..-1].strip }
#   end
#
#   def wrap_in_tags
#     strip_markdown.map {|line| "  <img src #{line}></img>"}
#   end
#
#   def formatted_text
#     wrap_in_tags.join("\n")
#   end
# end
#
# # def image(link, title, content)
# #   content &&= content + " "
# #   "#{![content]}#{(link)}"
# #   # "#{content}#{link}"
# # end
