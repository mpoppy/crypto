
#my CLI Controller - responsible for user interaction

class CLI

  def call
    puts "Today's crypto prices."
    puts <<-DOC
      1. Bitcoin BTC $10K
      2. Ethereum Eth $200
      3. Litecoin Ltc $100
      4. Ripple Xrp $.32
    DOC
  end

  # def list_crypto
  # end
  #
  # def menu
  # end
end
