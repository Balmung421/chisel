class Paragraph

  def initialize(text)
    @text = text
  end

  def call
    <<-eos
<p>
    #{format_linebreaks}
</p>
eos
  end

  def format_linebreaks
    @text.chomp.gsub("\n", "<br>\n    ")
  end
end
