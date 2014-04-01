require "nokogiri"

module Jekyll
  module TableFilter
    def tableize(html)
      doc = Nokogiri::HTML.fragment(html)
      links = doc.css('a')
      convert_links(links)
      
      h1s = doc.css('h1')
      convert_h1s(h1s)

      h2s = doc.css('h2')
      convert_h2s(h2s)

      doc.inner_html
    end

    private 

    def convert_links(links)
      links.map do |link|
        link['style'] = "color:#20b6fb;text-decoration:none;"
      end
    end

    def convert_h1s(h1s)
      h1s.map { |h1| h1['style'] = "font-size:27px;color:#939393;padding:10px 0px 17px 22px;font-weight:bold;line-height:22px;" }
    end

    def convert_h2s(h2s)
      h2s.map { |h2| h2['style'] = "font-size:20px;color:#20b6fb;padding:10px 0px 17px 22px;font-weight:bold;line-height:22px;" }
    end

    

  end
end

Liquid::Template.register_filter(Jekyll::TableFilter)