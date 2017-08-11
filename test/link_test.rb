require 'minitest/autorun'
require 'minitest/pride'
require './lib/links'

class LinksTest < Minitest::Test

  def test_it_splits_the_string_where_bracket_paren_meet
    input_text = "[This link](http://example.net/)"
    expected = '<a href="http://example.net/">This link</a>'

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_collects_the_link
    input_text = "[This link](http://example.net/)"
    expected = "<a href=\"http://example.net/\">This link</a>"

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_replaces_the_open_bracket_with_href_tag
    input_text = "Stuff outside of the link [This link](http://example.net/)"
    expected = 'Stuff outside of the link <a href="http://example.net/">This link</a>'

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_formats_markdown_to_html_links
    input_text = '[This link](http://example.net/) has no title attribute.'
    expected = '<a href="http://example.net/">This link</a> has no title attribute.'

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_calls_call_if_there_is_only_one_link
    input_text = '[This link](http://example.net/) has no title attribute.'
    expected = '<a href="http://example.net/">This link</a> has no title attribute.'

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_supports_inline_titles
    input_text = 'This is [an example](http://example.com/ "Title") inline link.'
    expected = 'This is <a href="http://example.com/" title="Title">an example</a> inline link.'

    assert_equal expected, Links.new(input_text).call
  end

  def test_it_supports_multiple_links
    input_text = 'This is [an example](http://example.com/ "Title") inline link. [This link](http://example.net/) has no title attribute.'
    expected = 'This is <a href="http://example.com/" title="Title">an example</a> inline link.<a href="http://example.net/">This link</a> has no title attribute.'

    assert_equal expected, Links.new(input_text).call
  end
end
