require 'minitest/autorun'
require 'minitest/pride'
require './lib/paragraph'

class ParagraphTest < Minitest::Test

  def test_it_wraps_the_paragraph_in_p_tags
    input_text = "This is the first line of the paragraph."

    expected_text = <<-eos
<p>
    This is the first line of the paragraph.
</p>
eos

    assert_equal expected_text, Paragraph.new(input_text).call
  end

  def test_it_wraps_a_multiline_paragraph_in_p_tags
    input_text ="This is the first line of the paragraph.\nThis is the second line of the same paragraph."

    expected_text =<<-END_OF_STRING
<p>
    This is the first line of the paragraph.<br>
    This is the second line of the same paragraph.
</p>
END_OF_STRING

    assert_equal expected_text, Paragraph.new(input_text).call
  end
end
