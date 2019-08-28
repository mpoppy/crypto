require 'pry'

class Currency
  attr_accessor :name, :symbol
  #add url as attribute accessor?

  @@all = []

  def initialize(crypto_hash)
    crypto_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  # def list
  #   self.scrape_crypto
  # end

  def self.create_from_collection(crypto_array)
    crypto_array.each do |crypto_hash|
      Currency.new(crypto_hash)
    end
    # crypto_list = []
    # # crypto << self.Scraper.new.price_scraper #scrapes and then gives array with hashes of data
    #   Scraper.new.price_scraper.each do |currency|
    #   crypto = Currency.new
    #   crypto.name = currency[:name]
    #   crypto.symbol = currency[:symbol]
    #   crypto_list << crypto
    # end
    # crypto_list

    def add_crypto_attributes(attributes_hash)
      attributes_hash.each do |attr, value|
        self.send("#{attr}=", value)
      end
      self
    end

  end

  def self.all
    @@all
  end


end
