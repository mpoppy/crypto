require 'pry'

class Currency
  :name, :symbol

  @all = {}

  def initialize
    @@all << self
  end

  def create_from_url
    properties = Scraper.new.price_scraper
    binding.pry
    properties.each do |currency|
      # @name = currency[name]
      # @symbol =
    end
  end

  def self.all
    @all
  end

end

Currency.new.create_from_url
