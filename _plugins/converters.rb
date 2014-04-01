require "redcarpet"

class Tablize < Redcarpet::Render::HTML
  def link(link, title, content)
    "<td style='font-size:20px;color:#20b6fb;padding:10px 0px 17px 22px;font-weight:bold;line-height:22px;'><a style='color:#20b6fb;text-decoration:none;' href='#{link}'> #{content} </a>"
  end  
end