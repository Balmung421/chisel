# class Emphasize
#
#   def initialize(text)
#     @text = text
#   end
#
#   def call
#     render_em_tags
#   end
#
#   def render_em_tags
#     counter = 0
#     @text.chars.map do |char|
#       counter += 1 if char == "*"
#       counter.odd? ? char.gsub("*", "<em>") : char.gsub("*", "</em>")
#     end.join
#   end
# end


class Emphasize
  attr_reader :parsed

  def initialize(parsed)
    @parsed = parsed
  end

    def call
      render_em_tags
    end
  def substitute
    parsed.gsub!('&', '&amp;') if parsed.include?('&')
    parsed.gsub!('**', '<strong>') if parsed.include?('**')
    parsed.gsub!('*', '<em>') if parsed.include?('*')
    parsed
  end

  def render_em_tags
    emphasized = substitute.split(/ /).map do |word|
      if word.end_with?('<strong>')
        word.chomp('<strong>') + '</strong>'
      elsif word.end_with?('<em>')
        word.chomp('<em>') + '</em>'
      else
        word
      end
    end
    emphasized.join(" ")
  end
end
