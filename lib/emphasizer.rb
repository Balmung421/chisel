class Emphasizer
  attr_reader :parsed

  def initialize(parsed)
    @parsed = parsed
  end

  def substitute
    parsed.gsub!('&', '&amp;') if parsed.include?('&')
    parsed.gsub!('**', '<strong>') if parsed.include?('**')
    parsed.gsub!('*', '<em>') if parsed.include?('*')
    parsed
  end

  def emphasize
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
