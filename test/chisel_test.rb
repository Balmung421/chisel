require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test

  attr_reader :chisel

  def setup
    @chisel = Chisel.new(File.open('input.md', "r"),  File.open('output.html', "w"))
  end

  def test_if_chisel_exists
    assert_instance_of Chisel, chisel
  end

end
