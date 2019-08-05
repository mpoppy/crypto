
require 'open-uri'

class CoinbaseScraper

  def price_scraper
    doc = NokoGirl::HTML(open("https://www.coinbase.com/price"))
    crypto_list = []
    binding.pry
  end
end
