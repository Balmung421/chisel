require 'minitest/autorun'
require 'minitest/pride'
require  './lib/strong'

class StrongTest < Minitest::Test

  def test_it_responds_to_call
    assert true, Strong.new("what").respond_to?(:call)
  end

  def test_it_replaces_double_stars_with_strong_tags
    input_text = "This **should not** be stars"
    expected = "This <strong>should not</strong> be stars"

    assert_equal expected, Strong.new(input_text).render_strong_tags
  end

  def test_it_adds_strong_tags_if_stars_are_in_pairs
    input_text = "This is **a bold move**"
    expected = "This is <strong>a bold move</strong>"

    assert_equal expected, Strong.new(input_text).render_strong_tags
  end

  def test_it_only_substitutes_if_the_stars_are_in_pairs
    input_text = "Hello *this* should do **something**"
    expected = "Hello *this* should do <strong>something</strong>"

    assert_equal expected, Strong.new(input_text).render_strong_tags
  end

end
