xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Dotide帮助"
  xml.subtitle "Dotide帮助站点"
  xml.id "http://help.dotide.com/"
  xml.link "href" => "http://help.dotide.com/cn/"
  xml.link "href" => "http://help.dotide.com/cn/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Dotide" }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name (article.data.author || "Dotide") }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
