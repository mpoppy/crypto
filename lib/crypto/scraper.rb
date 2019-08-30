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
          url = crypto.search("td.AssetTableRow__Td-sc-1e35vph-1 a").attr("href").text unless index == 16
          cryptos << {name: name, symbol: symbol, url: url} unless index == 16
        end
        cryptos
    end

    def get_crypto_detail
      Nokogiri::HTML(open("https://www.coinbase.com/price/ethereum"))
    end

    def detail_scraper
      crypto_details = []
      doc = self.get_crypto_detail
      info = doc.search("h6.Header__StyledHeader-sc-1q6y56a-0 span")
      market_cap = info[0].text
      circulating_supply = info[2].text
      all_time_high = info[4].text
      crypto_details << {market_cap: market_cap, circulating_supply: circulating_supply, all_time_high: all_time_high}
      crypto_details
    end

end
