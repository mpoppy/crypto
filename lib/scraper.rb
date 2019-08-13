require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coinbase.com/price")) 
  end

  def price_scrape
    crypto_info = self.get_page.css("tbody.AssetTable__AssetTableBody-sc-3hlimn-0 tr")
    crypto_info.each do |crypto|
      binding.pry
      puts crypto.css("h4.Header__StyledHeader-sc-1q6y56a-0 gEArVu TextElement__Spacer-sc-18l8wi5-0 hpeTzd").text
    end

  end

  def assign_crypto

  end
end

Scraper.new.price_scrape
