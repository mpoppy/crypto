require 'nokogiri'
require 'open-uri'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coinbase.com/price")) #load the site into this variable
  end

  def price_scrape
    crypto_info = get_page.css("tbody.AssetTable__AssetTableBody-sc-3hlimn-0 tr") #this grabs the entire crypto table
  end

  def assign_crypto
  end 
end
