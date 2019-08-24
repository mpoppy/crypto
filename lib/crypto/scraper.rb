require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_list_page
    Nokogiri::HTML(open("https://www.coinbase.com/price"))
  end

  def price_scraper
      cryptos = []
      crypto_page = self.get_list_page.css("tbody.AssetTable__AssetTableBody-sc-3hlimn-0 tr")
      crypto_page.each_with_index do |crypto, index|
          name = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[1].text unless index == 16
          symbol = crypto.search("h4.Header__StyledHeader-sc-1q6y56a-0")[2].text unless index == 16
          cryptos << {name: name, symbol: symbol} unless index == 16
        end
        cryptos
    end

    def get_crypto_detail(name)
      Nokogiri::HTML(open("https://www.coinbase.com/price/#{name}"))
    end

    def detail_scraper(name)
      doc = self.get_crypto_detail(name)
      binding.pry
    end


end

Scraper.new.detail_scraper("bitcoin")
