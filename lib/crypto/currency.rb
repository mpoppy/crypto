require 'pry'

class Currency
  attr_accessor :name, :symbol, :url, :market_cap, :circulating_supply, :all_time_high, :price, :bio


  @@all = []

  def initialize(crypto_hash)
    crypto_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(crypto_array)
    crypto_array.each do |crypto_hash|
      Currency.new(crypto_hash)
    end
  end

  def add_crypto_attributes(attributes_hash)
    attributes_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    self
  end

  def self.all
    @@all
  end

end
