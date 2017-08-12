require './lib/chisel'

if __FILE__ == $0
input_file = File.read(ARGV[0])
output_file = (ARGV[1])

parser = Chisel.new(input_file, output_file)
File.write(output_file, parser.parse)
puts "Converted the markdown in #{ARGV[0]} to html in #{ARGV[1]}."
end
