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
        test.add_card(Card.new('k',13,'Clubs'))
        expect(test.deck_length).to eq(1)
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
  describe '#shuffle'do#this will fail on occasion if first card doesn't change location
    context 'at the beginning of the game' do
      it 'shuffles the deck'do
        test = Deck.new
        test.create_52_card_deck
        card=test.deck.first_node
        test.shuffle
        expect(test.deal_card).to_not eq(card.value)
      end
    end
  end
  describe '#deal_card' do
    context 'dealing a card from your deck' do
      it 'deals the top card' do
        test = Deck.new
        card=Card.new('k',13,'Clubs')
        test.add_card(card)
        expect(test.deal_card).to eq(card)
        expect(test.deck_length).to eq(0)
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
      it 'should return a hash without an error' do
        player1 = Player.new("Jered")
        player2 = Player.new("Gideon")
        card1 = Card.new('Q',12,'Clubs')
        card2 = Card.new('K',13,'Clubs')
        expect(WarAPI.play_turn(player1,card1,player2,card2)).to be_a(Hash)
      end
    end

    context 'The players hands were a draw' do
      it 'should return a hash without an error' do
        player1 = Player.new("Jered")
        player2 = Player.new("Gideon")
        card1 = Card.new('K',13,'Clubs')
        card2 = Card.new('Q',12,'Clubs')
        10.times do
        player2.add_to_hand(card2)
        end
        10.times do
        player1.add_to_hand(card1)
        end
        expect(WarAPI.play_turn(player1,card1,player2,card1)).to be_a(Hash)
      end
    end

    context 'The players hands were a draw' do
      it 'should return a hash without an error' do
        test = War.new("Jered", "Gideon")
        25.times do
          test.play_game
        end
      end
    end

    context 'The it can play 1 full game and print the winner' do
      it 'should print winner without an error' do
        test = War.new("Jered", "Gideon")
        test.full_game
      end
    end
  end
end

describe 'Linked_list' do
  context 'when creating a new linked list with no initial value' do
    it 'creates a new linked list with the first node and last node equal to nil'do
      test_list = Linked_list.new
      expect(test_list.first_node).to be_nil
      expect(test_list.last_node).to be_nil
    end

    it 'creates a new linked list with the first node and last node'do
      test_list = Linked_list.new("practice card")
      expect(test_list.first_node.value).to eq("practice card")
      expect(test_list.last_node.value).to eq("practice card")
    end
  end

  describe '#add_node' do
    context 'when adding a new node to the linked list' do
      it 'moves the last_node to the newest node and leaves the first_node alone'do
        test_list = Linked_list.new("practice card")
        test_list.add_node("second card")
        test_list.add_node("third card")

        expect(test_list.first_node.value).to eq("practice card")
        expect(test_list.last_node.value).to eq("third card")
      end
    end
  end
  describe 'Plays 10 full games without error' do
    it 'plays a game'do
      expect(10.times do
              play_full_game
            end).to
    end
  end

end




