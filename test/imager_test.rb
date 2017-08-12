require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/imager'

class ImagerTest < MiniTest::Test
  attr_reader :imager

  def setup
    @imager = Imager.new
  end

  def test_it_can_take_a_string
    expected = "<p><img src=interspace-starcadian.jpg>Starcadian</img></p>\n"
    assert_equal expected, imager.image_replacer("![Starcadian](interspace-starcadian.jpg)")
  end

  def test_no_alt_text
    expected = "<p><img src= interspace-starcadian.jpg></img></p>\n"
    assert_equal expected, imager.image_replacer("![](interspace-starcadian.jpg)")
  end

end
