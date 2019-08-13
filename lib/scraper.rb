require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coinbase.com/price"))
  end

  def price_scraper
      crypto_page = self.get_page.css("tbody.AssetTable__AssetTableBody-sc-3hlimn-0 tr")
      crypto_page.each do |crypto|
            name = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[1].text
            symbol = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[2].text
            puts "#{name}: #{symbol}"
      end
    end

  def assign_crypto

  end
end

Scraper.new.price_scraper
