require 'minitest/autorun'
require 'minitest/pride'
require './lib/linker'

class LinkerTest < Minitest::Test
  def test_it_will_convert_an_inline_link
    link = Linker.new
    expected = "<p><a href=http://example.net/>This link</a></p>\n"
    assert_equal expected, link.link_replacer("[This link](http://example.net/)")
  end
end
