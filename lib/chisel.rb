require_relative 'render'

class Chisel

  attr_reader :input, :output, :renderer

  def initialize(input, output)
    @input = input.read
    @output = output
    @renderer = Render.new(@input)
  end

  def call
    output.write(renderer.call)
  end
end

if __FILE__ == $0
  to_be_converted = File.open(ARGV[0], "r")
  converted_text = File.open(ARGV[1], "w")

  chisel = Chisel.new(to_be_converted, converted_text)
  chisel.call
  puts "Converted the markdown in #{ARGV[0]} to html in #{ARGV[1]}."
end
