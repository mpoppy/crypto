# Crypto

Welcome to my Crypto Gem Scraper!

Welcome to my first gem built as part of my Flatiron School online bootcamp! In this gem, you will be scrape information on the top cryptocurrencies from Coinbase.com. For each currency, you can then go 1 level deeper and view additional information on the currency including market cap, all-time high, and circulating supply.

The Ruby code in the file `lib/crypto` represents my object classes for my controller, my currency class, and my scraper class. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crypto

## Usage

1. Run 'bin/crypto' to execute the gem.
2. The program will scrape the cryptocurrencies listed on Coinbase.com/price
3. The CLI will prompt the user to enter a number corresponding to the original list to find more details.
4. The program will scrape the details page of that corresponding currency and display additional details in the CLI.
5. The program loops and will ask the user for an additional currency until they want to 'exit' the program by typing 'exit'.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'passionate-optimization-7398'/crypto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Crypto project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'passionate-optimization-7398'/crypto/blob/master/CODE_OF_CONDUCT.md).
