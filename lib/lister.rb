class Lister
  def ul_replacer(string)
    "<ul>\n" + string.gsub(/\* (.+)/, "<li>\\1</li>") + "\n</ul>\n"
  end

  def ol_replacer(string)
    "<ol>\n" + string.gsub(/^\d+\. (.+)/, "<li>\\1</li>") + "\n</ol>\n"
  end
end
