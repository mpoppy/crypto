
#my CLI Controller - responsible for user interaction

class CLI

  def call
    puts "Today's Top Cryptocurrencies:"
    list_crypto
    puts "Would you like to get more information on a specific cryptocurrency? Y/N"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      add_attributes_to_crypto
      menu
    else
      puts "Goodbye!"
    end
  end

  def list_crypto
    crypto_array = Scraper.new.price_scraper
    Currency.create_from_collection(crypto_array)
    Currency.all.each_with_index do |c, i|
      puts "#{i + 1}. #{c.name} - #{c.symbol} - price:#{c.price}"
      sleep 0.25
    end
  end

  def add_attributes_to_crypto
    puts "Downloading Details, one moment.."
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

          About #{c.name}
          #{c.bio}

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
