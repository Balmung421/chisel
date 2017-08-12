class Header
  def header_replacer(string)
    count = string.count("#")
    string.gsub("#{"#" * count}", "<h#{count}>") + " </h#{count}>\n"
  end
end
