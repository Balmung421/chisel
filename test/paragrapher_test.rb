require 'minitest/autorun'
require 'minitest/pride'
require './lib/paragrapher'

class ParagrapherTest < MiniTest::Test
  def test_it_will_parse_a_paragraph
    par = Paragrapher.new
    expected = "<p>\nThis is my paragraph\n</p>\n"
    assert_equal expected, par.paragraph_replacer("This is my paragraph")
  end
end
