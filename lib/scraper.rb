require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coinbase.com/price"))
  end

  def price_scraper
      cryptos = []
      crypto_page = self.get_page.css("tbody.AssetTable__AssetTableBody-sc-3hlimn-0 tr")
      crypto_page.each_with_index do |crypto, index|
          name = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[1].text unless index == 16
          symbol = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[2].text unless index == 16
          puts "#{index + 1}.#{name}: #{symbol}"
          cryptos << {name: name, symbol: symbol} unless index == 16
        end
        binding.pry
        cryptos
    end

  def assign_crypto

  end
end

Scraper.new.price_scraper
