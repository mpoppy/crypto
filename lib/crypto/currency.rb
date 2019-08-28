require 'pry'

class Currency
  attr_accessor :name, :symbol
  #add url as attribute accessor?

  def list
    self.scrape_crypto
  end

  def scrape_crypto
    crypto_list = []
    # crypto << self.Scraper.new.price_scraper #scrapes and then gives array with hashes of data
      Scraper.new.price_scraper.each do |currency|
      crypto = Currency.new
      crypto.name = currency[:name]
      crypto.symbol = currency[:symbol]
      crypto_list << crypto
    end
    crypto_list
  end


end
