require 'minitest/autorun'
require 'minitest/pride'
require './lib/lister'

class ListerTest < Minitest::Test
  def test_it_will_parse_an_unordered_list
    list = Lister.new
    expected = "<ul>\n<li>Sushi</li>\n<li>More Sushi</li>\n</ul>\n"
    assert_equal expected, list.ul_replacer("* Sushi\n* More Sushi")
  end

  def test_it_will_parse_an_ordered_list
    list = Lister.new
    expected = "<ol>\n<li>Sushi</li>\n<li>More Sushi</li>\n<li>SUSHI!</li>\n</ol>\n"
    assert_equal expected, list.ol_replacer("1. Sushi\n2. More Sushi\n3. SUSHI!")
  end
end
