# Credit Card Validator

Validate a credit card number according to the [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm). Also determine the type of credit card by its number (AMEX, Discover, MaserCard and Visa).

Tested in Ruby 1.8.7, 1.9.2, 1.9.3 and 2.0.0.

## Installation

Add this line to your application's Gemfile:

    gem 'credit_card_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_validator

## Usage

### Validate Card number

Call `CreditCardValidator.valid?(card_number)`. This will return true or false representing the card's validity.

### Determine Card type

Call `CreditCardValidator.card_type(card_number)`. This will return a string representing the card type. Possible return values are:

- VISA
- AMEX
- Discover
- MasterCard
- Unknown

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
