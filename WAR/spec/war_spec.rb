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
        expect(test.deck_length).to eq(0)
      end
    end
  end
  describe '#add_card'do
    context 'recieves a new card to add' do
      it 'adds the card to the end of the deck' do
        test = Deck.new
        card = Card.new('k',13,'Clubs')
        test.add_card(card)
        expect(test.deck.last_node.value).to eq(card)
      end
    end
  end
  describe '#create_52_card_deck'do
    it 'creates a new deck of 52 cards' do
      test = Deck.new
      test.create_52_card_deck
      expect(test.deck_length).to eq(52)
    end
  end
  describe '#shuffle'do
    context 'at the beginning of the game' do
      xit 'shuffles the deck'do
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
      xit 'deals the top card' do
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
    xit 'has a name and a deck' do
      test = Player.new('jered')
      expect(test.name).to eq('jered')
      expect(test.hand).to be_a(Deck)
    end
  end
end

describe 'War' do
  context 'a new War game is created' do
    xit 'has two players' do
      test = War.new("Jered", "Gideon")
      expect(test.player1.name).to eq('Jered')
      expect(test.player2.name).to eq('Gideon')
    end
  end
  describe '#play_game' do
    context 'starting a new game' do
      xit 'returns a Hash' do
        test = War.new("Jered", "Gideon")
        expect(test.play_game).to be_a(Hash)
      end
    end
  end
end

describe 'WarAPI' do
  describe '#self.play_turn' do
    context 'recieves two different cards for the players' do
      xit 'should print out a winner and ' do

      end
    end
  end
end

describe 'Linked_list' do
  context 'when creating a new linked list with no initial value' do
    xit 'creates a new linked list with the first node and last node equal to nil'do
      test_list = Linked_list.new
      expect(test_list.first_node).to be_nil
      expect(test_list.last_node).to be_nil
    end
    xit 'creates a new linked list with the first node and last node'do
      test_list = Linked_list.new("practice card")
      expect(test_list.first_node.value).to eq("practice card")
      expect(test_list.last_node.value).to eq("practice card")
    end
  end
  describe '#add_node' do
    context 'when adding a new node to the linked list' do
      xit 'moves the last_node to the newest node and leaves the first_node alone'do
        test_list = Linked_list.new("practice card")
        test_list.add_node("second card")
        test_list.add_node("third card")

        expect(test_list.first_node.value).to eq("practice card")
        expect(test_list.last_node.value).to eq("third card")
    end
  end
  end
end


