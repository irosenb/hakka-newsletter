require "rest_client"
require "json"
require "nokogiri"
require "pry"

module Jekyll
  module TimeFilter
    def reading_time(link)
      binding.pry
      response = JSON.parse(RestClient.get("http://reading-time.samrat.me/api?url=#{link}"))
      time = response['minutes'].round
      
      document = Nokogiri::HTML::Builder.new do |doc|
        doc.span(:style => "color:grey;font-size:12px;font-weight:normal;") {
          doc.text "#{time}"
        }
        doc.br
      end

      document.doc.inner_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::TimeFilter)