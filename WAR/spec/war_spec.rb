require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../war.rb'
describe 'Card'do
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

describe 'Deck' do
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
      test.create_52_card_deck
      expect(test.deck.count).to eq(52)
    end
  end
  describe '#shuffle'do
    context 'at the beginning of the game' do
      it 'shuffles the deck'do
        test = Deck.new
        test.create_52_card_deck
        card=test.deck[0]
        test.shuffle
        expect(test.deck[0]).to_not eq(card)
      end
    end
  end
  describe '#deal_card' do
    context 'dealing a card from your deck' do
      it 'deals the top card' do
        test = Deck.new
        test.create_52_card_deck

        card=test.deck[0]
        expect(test.deal_card).to eq(card)
      end
    end
  end
end

describe 'Player' do
  context 'creating a new player' do
    it 'has a name and a deck' do
      test = Player.new('jered')
      expect(test.name).to eq('jered')
      expect(test.hand).to be_a(Deck)
    end
  end
end
describe 'War' do
  context 'a new War game is created' do
    it 'has two players' do
      test = War.new("Jered", "Gideon")
      expect(test.player1.name).to eq('Jered')
      expect(test.player2.name).to eq('Gideon')
    end
  end
  describe '#play_game' do
    context 'starting a new game' do
      it 'returns a Hash' do
        test = War.new("Jered", "Gideon")
        expect(test.play_game).to be_a(Hash)
      end
    end
  end
end
describe 'WarAPI' do
  describe '#self.play_turn' do
    context 'recieves two different cards for the players' do
      it 'should print out a winner and ' do

      end
    end
  end
end


