
#my CLI Controller - responsible for user interaction

class CLI

  def call
    list_crypto
    menu
  end

  def list_crypto
    puts "Today's crypto prices."
    puts <<-DOC
      1. Bitcoin BTC $10K
      2. Ethereum Eth $200
      3. Litecoin Ltc $100
      4. Ripple Xrp $.32
    DOC
  end




  def menu
    puts "Enter the number for which you would like to get more inforation on."
    input = gets.strip
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
