def class_s(name)
  class_name = name.capitalize
  class_name.gsub!(/[-_.\s]([a-zA-Z0-9])/) { Regexp.last_match(1).upcase }
  class_name.tr!("+", "x")
  class_name
end
