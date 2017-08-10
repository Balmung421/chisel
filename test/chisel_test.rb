require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test

  attr_reader :chisel, :input, :output, :renderer

  def setup
    @chisel = Chisel.new(File.open('input.md', "r"),  File.open('output.html', "w"))
    @input = File.open('input.md', "r").read
    @output = File.open('output.html', "w")
    # @renderer = Render.new(@input)
  end

  def test_if_chisel_exists
    assert_instance_of Chisel, chisel
  end

  def test_it_reads_the_file
    assert true, input
  end

  def test_the_output_file_is_empty_and_can_be_written_to
    assert true, File.zero?(output)
  end

  def test_it_sends_input_to_renderer
    assert true, chisel.respond_to?(:call)
  end

  def test_it_writes_the_return_value_to_the_output_file
    assert_equal Fixnum, chisel.call.class
  end

end
