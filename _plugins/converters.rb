module Jekyll
  class TableConverters < Converter
    def matches(ext)
      ext =~ /markdown/
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.gsub(/\[([^\[]+)\]\(([^\)]+)\)/, "<a style=\"color:#20b6fb;text-decoration:none;\" href=\"\">")
    end
  end
end