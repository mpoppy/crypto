
#my CLI Controller - responsible for user interaction

class CLI

  def call
    list_crypto
    menu
  end

  def list_crypto
    puts "Today's Top Cryptocurrencies:"
    crypto_array = Scraper.new.price_scraper
    Currency.create_from_collection(crypto_array)
    Currency.all.each_with_index do |c, i|
      puts "#{i + 1}. #{c.name} - #{c.symbol}"
    end
  end

  def add_attributes_to_students
    Currency.all.each do |currency|
      attributes = Scraper.new.detail_scraper(currency.profile_url)
      currency.add_crypto_attributes(attributes)
    end
  end


  def menu
    puts "Enter the name or the symbol for which you would like to get more information on."
    input = gets.strip.downcase
    case input
    when "1"
      puts "more information on crypto 1"

    when "2"
      puts "more information on crypto 2"
    when "3"
      puts "more information on crypto 3"
    when "4"
      puts "more information on crypto 4"
    end
  end
end
