require "nokogiri"

module Jekyll
  module TableFilter
    def tableize(html)
      doc = Nokogiri::HTML.fragment(html)

      links = doc.css('a')
      convert_links(links)
      
      h1s = doc.css('h1')
      h1s.wrap("<tr></tr>")
      convert_h1s(h1s)

      h2s = doc.css('h2')
      h2s.wrap("<tr></tr>")
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
      h1s.map do |h1|
        # h1.replace("<tr>#{h1.to_html}</tr>")
        h1.name = "td"
        h1['style'] = "font-size:27px;color:#939393;padding:10px 0px 17px 22px;font-weight:bold;line-height:22px;" 
      end
    end

    def convert_h2s(h2s)
      h2s.map do |h2|
        # h2.replace("<tr>#{h2.to_html}</tr>")
        h2.name = "td"
        h2['style'] = "font-size:20px;color:#20b6fb;padding:10px 0px 17px 22px;font-weight:bold;line-height:22px;"
      end
    end



  end
end

Liquid::Template.register_filter(Jekyll::TableFilter)