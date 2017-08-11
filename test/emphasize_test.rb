require 'minitest/autorun'
require 'minitest/pride'
require  './lib/emphasize'

class EmphasizeTest < Minitest::Test

  def test_it_replaces_single_stars_with_em_tags
    input_text = "This is *emphasized* properly"
    expected = "This is <em>emphasized</em> properly"

    assert_equal expected, Emphasize.new(input_text).call
  end

  def test_it_finds_multiple_sets_of_stars_and_replaces_them_with_em_tags
    input_text = "This is *emphasized* properly and *this* too"
    expected = "This is <em>emphasized</em> properly and <em>this</em> too"

    assert_equal expected, Emphasize.new(input_text).call
  end
end
