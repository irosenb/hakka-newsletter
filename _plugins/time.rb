require "rest_client"
require "json"
require "nokogiri"

module Jekyll
  module TimeFilter
    def reading_time(link)
      response = JSON.parse(RestClient.get("http://reading-time.samrat.me/api?url=#{link}"))
      time = response['minutes'].round
      document = Nokogiri::HTML::DocumentFragment.parse ""
      Nokogiri::HTML::Builder.with(document) do |doc|
        doc.span(:style => "color:grey;font-size:12px;font-weight:normal;") {
          doc.text "#{time} mins"
        }
        doc.br
      end

      document.to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::TimeFilter)