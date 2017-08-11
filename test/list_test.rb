require 'minitest/autorun'
require 'minitest/pride'
require  './lib/list'

class UnorderedListTest < Minitest::Test

  def test_it_handles_input_at_initialize
    input = "Steve"
    assert UnorderedList.new(input)
  end

  def test_it_splits_the_input_at_single_new_lines
    input = "* Sushi\n* BBQ\n* Mexican"
    assert_equal 3, UnorderedList.new(input).split_lines.length
  end

  def test_it_removes_preceeding_asterisks
    input = "* Sushi\n* BBQ\n* Mexican"
    assert_equal "Sushi", UnorderedList.new(input).strip_markdown.first
  end

  def test_it_wraps_list_items_in_li_tags
    input = "* Sushi\n* BBQ\n* Mexican"
    assert_equal "  <li>Sushi</li>", UnorderedList.new(input).wrap_in_tags.first
  end

  def test_it_formats_text
    input = "* Sushi\n* BBQ\n* Mexican"
    expected = "  <li>Sushi</li>\n  <li>BBQ</li>\n  <li>Mexican</li>"
    assert_equal expected, UnorderedList.new(input).formatted_text
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
    assert_equal expected, UnorderedList.new(input).call
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
    assert_equal expected, OrderedList.new(input).call
  end
end
