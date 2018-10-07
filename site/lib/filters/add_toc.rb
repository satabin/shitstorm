require 'nokogiri'

Class.new(Nanoc::Filter) do
  identifier :add_toc

  def run(content, _params = {})
    content.gsub('<<TOC>>') do
      # Find all top-level sections
      doc = Nokogiri::HTML(content)
      headers = doc.xpath('//div[@id="main"]/*[self::h2 or self::h3]').map do |header|
        title = header['data-nav-title'] || header.inner_html
        { title: title, id: header['id'], level: header.name[-1].to_i }
      end

      next '' if headers.empty?

      # Build table of contents
      last_level = 2
      res = +'<ol>'
      headers.each do |header|
        if header[:level] > last_level then
          res << '<ol>'
        elsif header[:level] < last_level then
          res << '</ol>'
        end
        res << %(<li><a href="##{header[:id]}">#{header[:title]}</a></li>)
        last_level = header[:level]
      end
      while last_level > 1 do
        res << '</ol>'
        last_level -= 1
      end

      res
    end
  end
end
