require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/header'

class HeaderTest < MiniTest::Test
  attr_reader :header

  def setup
    @header = Header.new
  end

  def test_it_can_take_a_string
    expected = "<h1> This is a test </h1>\n"
    assert_equal expected, header.header_replacer("# This is a test")
  end

  def test_it_can_take_a_string_with_two_things
    expected = "<h2> This is another test </h2>\n"
    assert_equal expected, header.header_replacer("## This is another test")
  end

  def test_it_can_replace_five_header_tags
    expected = "<h5> This is the biggest test </h5>\n"
    assert_equal expected, header.header_replacer("##### This is the biggest test")
  end
end
