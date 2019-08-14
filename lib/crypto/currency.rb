require 'pry'

class Currency
  attr_accessor :name, :symbol

  @@all = []

  def initialize(crypto_array)
    @@all << self
  end

  def scrape_crypto
    array = Scraper.new.price_scraper #scrapes and then gives array with hashes of data
    array.each do |currency|
      Currency.new #for each item in the hash
      self.name = currency[:name]
      self.symbol = currency[:symbol]
      binding.pry
      @@all << self
    end
  end

  def self.all
    @@all
  end

end
