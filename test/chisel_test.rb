require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test

  attr_reader :chisel, :input, :output

  def setup
    @chisel = Chisel.new(File.open('input.md', "r"),  File.open('output.html', "w"))
    @input = File.open('input.md', "r").read
    @output = File.open('output.html', "w")
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

end
