require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/emphasizer'

class EmphasizerTest < Minitest::Test
  def test_it_will_parse_an_ampersand
    emp = Emphasizer.new("This & that")
    expected = "This &amp; that"
    assert expected, emp.substitute
  end

  def test_it_will_parse_one_asterisk
    emp = Emphasizer.new("This and *that*")
    expected = "This and <em>that</em>"
    assert expected, emp.emphasize
  end

  def test_it_will_parse_two_asterisks
    emp = Emphasizer.new("This and **that**")
    expected = "This and <strong>that</strong>"
    assert expected, emp.emphasize
  end

  def test_it_will_parse_mixed_asterisks
    emp = Emphasizer.new("**This** *and* **that**")
    expected = "<strong>This</strong> <em>and</em> <strong>that</strong>"
    assert expected, emp.emphasize
  end
end
