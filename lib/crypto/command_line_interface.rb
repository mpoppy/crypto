
#my CLI Controller - responsible for user interaction

class CLI

  def call
    puts "Today's Top Cryptocurrencies:"
    add_attributes_to_crypto
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

  def add_attributes_to_crypto
    Currency.all.each do |currency|
      attributes = Scraper.new.detail_scraper(currency.url)
      currency.add_crypto_attributes(attributes)
    end
  end


  def menu
    puts "Enter the number for the cryptocurrency for which you would like to get more information on."
    input = gets.strip
    if input != "exit"
      input = input.to_i
      Currency.all.select.with_index do |c, i|
        if input - 1 == i
          puts <<-DOC
          You have requested more information on #{input}: #{c.name}
          Symbol: #{c.symbol}
          Market cap: #{c.market_cap}
          Circulating supply: #{c.circulating_supply}
          All-time high: #{c.all_time_high}
          DOC
        end
      end
      menu
    else
      puts "Exiting program, have a good day!"
    end
  end

end
