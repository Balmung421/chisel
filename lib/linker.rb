class Linker
  def link_replacer(string)
    parts = string.split(/\[|\]|\(|\)/).join(" ").split("  ")
    "<p><a href=#{parts[1]}>#{parts[0].strip}</a></p>\n"
  end
end
