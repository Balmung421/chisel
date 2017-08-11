require_relative 'header'
require_relative 'paragrapher'
require_relative 'emphasizer'
require_relative 'lister'
require_relative 'linker'
require_relative 'imager'
require 'pry'

class Chisel
  attr_reader :markdown_file, :html_file

  def initialize(markdown_file, html_file =nil)
    @markdown_file = markdown_file
    @html_file = html_file
  end

  def split_text
    markdown_file.chomp("\n").split("\n\n")
  end

  def parse
    parsed_document = []
    split_text.each do |string|
      unless string.start_with?("*", "#", "[", "!") || string[0].to_i > 0
        parsed_document << Paragrapher.new.paragraph_replacer(string)
      end
      if string.start_with?("#")
        parsed_document << Header.new.header_replacer(string)
      elsif string.start_with?("*")
        parsed_document << Lister.new.ul_replacer(string)
      elsif string[0].to_i > 0
        parsed_document << Lister.new.ol_replacer(string)
      elsif string.start_with?("[")
        parsed_document << Linker.new.link_replacer(string)
      elsif string.start_with?("!")
        parsed_document << Imager.new.image_replacer(string)
      end
    end
    parsed = parsed_document.join("\n")
    Emphasizer.new(parsed).emphasize
  end
end
