
#my CLI Controller - responsible for user interaction

class CLI

  def call
    puts "Today's Top Cryptocurrencies:"
    list_crypto
    add_attributes_to_crypto
    menu
  end

  def list_crypto
    crypto_array = Scraper.new.price_scraper
    Currency.create_from_collection(crypto_array)
    Currency.all.each_with_index do |c, i|
      puts "#{i + 1}. #{c.name} - #{c.symbol}"
      sleep 0.25
    end
  end

  def add_attributes_to_crypto
    puts "One moment, program is loading"
    Currency.all.each do |currency|
      attributes = Scraper.new.detail_scraper(currency.url)
      currency.add_crypto_attributes(attributes)
    end
  end


  def menu
    puts "Enter the number for the cryptocurrency for which you would like to get more information on. Type 'exit' to leave the program. "
    #to relist cryptos type list
    #dont allow numb
    input = gets.strip.downcase
    if input != "exit"
      input = input.to_i - 1
      Currency.all.select.with_index do |c, i|
        if input == i && input >= 0 && input <= 30
          puts <<-DOC

          You have requested more information on #{input}: #{c.name}
          Symbol: #{c.symbol}
          Market cap: #{c.market_cap}
          Circulating supply: #{c.circulating_supply}
          All-time high: #{c.all_time_high}

          DOC
        end
      end
      puts "Invalid input"
      menu
    else
      puts "Exiting program, have a good day!"
    end
  end

end
