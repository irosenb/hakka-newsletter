require "nokogiri"

module Jekyll
  module TableFilter
    def tableize(html)
      doc = Nokogiri::HTML.fragment(html)
      links = doc.css('a')
      convert_links(links)


    end

    private 

    def convert_links(links)
      links.map do |link|
        link['style'] = "color:#20b6fb;text-decoration:none;"
      end
    end
  end
end