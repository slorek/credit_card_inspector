require 'spec_helper'

describe CreditCardValidator do
  
  let(:visa_valid) { ['4012888888881881', '4111111111111111'] }
  let(:visa_invalid) { '4111111111111' }
  let(:amex_valid) { '378282246310005' }
  let(:discover_valid) { '6011111111111117' }
  let(:mastercard_valid) { '5105105105105100' }
  let(:mastercard_invalid) { '5105 1051 0510 5106' }
  let(:unknown_card) { '9111111111111111' }
  
  describe '.card_type' do
    it 'matches VISA cards' do
      (visa_valid << visa_invalid).each do |card|
        described_class.card_type(card).should == 'VISA'
      end
    end

    it 'matches AMEX cards' do
      described_class.card_type(amex_valid).should == 'AMEX'
    end

    it 'matches Discover cards' do
      described_class.card_type(discover_valid).should == 'Discover'
    end

    it 'matches MasterCard cards' do
      [mastercard_valid, mastercard_invalid].each do |card|
        described_class.card_type(card).should == 'MasterCard'
      end
    end
    
    it 'returns "Unknown" when no match is found' do
      described_class.card_type(unknown_card).should == 'Unknown'
    end
  end
  
  describe '.sanitise_card_number' do
    it 'strips all non-numeric characters' do
      described_class.sanitise_card_number(mastercard_invalid).should == '5105105105105106'
    end
  end
end