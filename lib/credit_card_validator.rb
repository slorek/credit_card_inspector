require "credit_card_validator/version"

module CreditCardValidator
  
  def self.card_type(card_number)
    
    card_number = sanitise_card_number(card_number)
    
    card_validation_rules.each do |card_type, rule|
      return card_type if card_number.match rule
    end
    
    return 'Unknown'
  end
  
  def self.sanitise_card_number(card_number)
    card_number.to_s.gsub /[^0-9]/, ''
  end
  
  
  private
    def self.card_validation_rules
      {
        'AMEX' => /^(34|37)\d{13}$/,
        'Discover' => /^6011\d{12}$/,
        'MasterCard' => /^5[1-5]\d{14}$/,
        'VISA' => /^4\d{12}(\d{3})?$/
      }
    end
end
