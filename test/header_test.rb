require 'minitest/autorun'
require 'minitest/pride'
require './lib/header'

class HeaderTest < Minitest::Test

  def test_it_counts_the_tags
    input_text = "## This is a heading"
    expected = 2

    assert_equal expected, Header.new(input_text).counter
  end

  def test_it_strips_the_text_of_any_markdown
    input_text = "## This is a heading"
    expected = "This is a heading"

    assert_equal expected, Header.new(input_text).stripped_of_markdown
  end

  def test_it_wraps_an_h1_tag_around_a_header
    input_text = "# This is a heading"
    expected_text = "<h1>This is a heading</h1>"

    assert_equal expected_text, Header.new(input_text).call
  end

    def test_it_counts_and_adds_tags_for_h3
    input_text = "### This is an h3 heading."
    expected_text = "<h3>This is an h3 heading.</h3>"

    assert_equal expected_text, Header.new(input_text).call
  end

   def test_it_counts_and_adds_tags_for_h4
    input_text = "#### This is an h4 heading."
    expected_text = "<h4>This is an h4 heading.</h4>"

    assert_equal expected_text, Header.new(input_text).call
  end
end
