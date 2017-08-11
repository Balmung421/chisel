require 'minitest/autorun'
require 'minitest/pride'
require  './lib/render'

class RenderTest < Minitest::Test

  def test_it_makes_two_paragraphs_of_two_chunks #integration test
    input_text =<<-END_OF_STRING
This is the first line of the first paragraph.

This is the first line of the second paragraph.
END_OF_STRING

    expected_text = <<-END_OF_STRING
<p>
    This is the first line of the first paragraph.
</p>

<p>
    This is the first line of the second paragraph.
</p>
END_OF_STRING

    assert_equal expected_text, Render.new(input_text).call
  end

  def test_it_replaces_the_hash_pounds_with_h_tags
    input_text = "## This is an h2 header"
    expected = "<h2>This is an h2 header</h2>"

    assert_equal expected, Render.new(input_text).call
  end

  def test_it_detects_double_stars_and_adds_strong_tags
    input_text = "This **should** be bold"
    expected = "<p>\n    This <strong>should</strong> be bold\n</p>\n"

    assert_equal expected, Render.new(input_text).call
  end


  def test_it_detects_and_replaces_single_stars_with_em_tags
    input_text = "This *should* be emphasized."
    expected_text = "<p>\n    This <em>should</em> be emphasized.\n</p>\n"

    assert_equal expected_text, Render.new(input_text).call
  end

  def test_it_detetcts_and_replaces_single_stars_in_a_multiline_paragraph
    input_text = <<-END_OF_STRING
This is the first *line* of the first paragraph.

This is the first *line* of the second paragraph.
    END_OF_STRING

     expected_text = <<-END_OF_STRING
<p>
    This is the first <em>line</em> of the first paragraph.
</p>

<p>
    This is the first <em>line</em> of the second paragraph.
</p>
END_OF_STRING

    assert_equal expected_text, Render.new(input_text).call
  end

  def test_it_formats_string_with_both_single_and_double_stars
    input_text = "This is **a bold move** and it *might* be emphasized."
    expected = "<p>\n    This is <strong>a bold move</strong> and it <em>might</em> be emphasized.\n</p>\n"

    assert_equal expected, Render.new(input_text).call
  end

    def test_it_returns_rendered_unordered_list
    input = "* Sushi\n* BBQ\n* Mexican"
    expected = <<-EOS
<ul>
  <li>Sushi</li>
  <li>BBQ</li>
  <li>Mexican</li>
</ul>
EOS
    assert_equal expected, Render.new(input).call
  end

  def test_it_returns_rendered_ordered_list
    input = "1. Sushi\n2. BBQ\n3. Mexican"
    expected = <<-EOS
<ol>
  <li>Sushi</li>
  <li>BBQ</li>
  <li>Mexican</li>
</ol>
EOS
    assert_equal expected, Render.new(input).call
  end

  def test_it_formats_markdown_to_html_links
    input_text = '[This link](http://example.net/) has no title attribute.'
    expected = "<p>\n    <a href=\"http://example.net/\">This link</a> has no title attribute.\n</p>\n"

    assert_equal expected, Render.new(input_text).call
  end
end
