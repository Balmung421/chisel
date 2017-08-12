class Imager
  def image_replacer(string)
    parts = string.split(/!\[|\]|\(|\)/).join(" ").split("  ")
    "<p><img src=#{parts[1]}>#{parts[0].strip}</img></p>\n"
  end
end
