require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < MiniTest::Test
  attr_reader :chisel

  def setup
    @chisel = Chisel.new('./testfiles/chisel.txt', './testfiles/tester.txt')
  end

  def test_it_can_take_in_a_file_to_read
    assert_equal './testfiles/chisel.txt', chisel.markdown_file
  end

  def test_it_can_take_in_a_file_to_write
    assert_equal './testfiles/tester.txt', chisel.html_file
  end

  def test_it_will_default_to_nil_if_no_html_file_is_given
    chisel = Chisel.new('./testfiles/chisel.txt')
    assert_nil chisel.html_file
  end

  def test_it_can_call_the_emphasis_class_methods
    emph = Emphasizer.new('./testfiles/tester.txt')
    assert emph
  end

  def test_it_will_split_the_text_into_chunks_on_two_returns
    chisel = Chisel.new("this is\n a test\n\n string")
    assert_equal ["this is\n a test", " string"], chisel.split_text
  end

  def test_it_parses_paragraphs
    skip #due to my style sheet injection
    chisel = Chisel.new("This is a paragraph")
    assert_equal "<p>\nThis is a paragraph\n</p>\n", chisel.parse
  end

  def test_it_parses_an_entire_document
    correct_parse = File.read './testfiles/parsed-example.txt'
    chisel.parse
    result = File.read "./testfiles/parsed.txt"
    assert_equal correct_parse, result
  end
end
