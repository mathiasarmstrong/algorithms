require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../war.rb'
describe 'Card'
  describe '#initilaize' do
    context 'it recieves a rank value and suit' do
      it 'creates a new card with that rank value and suit' do
        test = Card.new('k',13,'Clubs')
        expect(test.rank).to eq('k')
        expect(test.value).to eq(13)
        expect(test.suit).to eq('Clubs')
      end
    end
  end
end
describe 'Deck'
  describe '#initilaize' do
    context 'creation of a new Deck' do
      it 'creates a new empty Deck' do
        test = Deck.new
        expect(test.deck.count).to eq(0)
      end
    end
  end
  describe '#add_card'do
    context 'recieves a new card to add' do
      it 'adds the card to the end of the placeholder deck' do
        test = Deck.new
        card = Card.new('k',13,'Clubs')
        test.add_card(card)
        expect(test.placeholder[-1]).to eq(card)
      end
    end
  end
  describe '#create_52_card_deck'do
    it 'creates a new deck of 52 cards' do
      test = Deck.new
      card = Card.new('k',13,'Clubs')
      test.add_card(card)
      expect(test.placeholder[-1]).to eq(card)
    end
  end

end
