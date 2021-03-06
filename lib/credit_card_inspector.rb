require "credit_card_inspector/version"

module CreditCardInspector
  
  def self.card_type(card_number)
    
    card_number = sanitise_card_number(card_number)
    
    card_validation_rules.each do |card_type, rule|
      return card_type if card_number.match rule
    end
    
    return 'Unknown'
  end
  
  def self.valid?(card_number)
    digits = sanitise_card_number(card_number).chars.collect(&:to_i).reverse
    
    total = digits.each_slice(2).map do |x, y|
      y ||= 0
      [x, (y * 2).divmod(10)]
    end.flatten.inject(:+)
    
    total % 10 == 0
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
