# This class is complete. You do not need to alter this



end
class Card
  # Rank is the rank of the card, 2-10, J, Q, K, A
  # Value is the numeric value of the card, so J = 11, A = 14
  # Suit is the suit of the card, Spades, Diamonds, Clubs or Hearts
  def initialize(rank, value, suit)
    @rank = rank
    @value = value
    @suit = suit
  end
end

# TODO: You will need to complete the methods in this class
class Deck
  attr_accessor :deck, :placeholder
  def initialize
    @deck = [] # Determine the best way to hold the cards
    @placeholder=[]
    @first_index=0
  end


  # Given a card, insert it on the bottom your deck
  def add_card(card)
    @placeholder<<card
  end

  # Mix around the order of the cards in your deck
  def shuffle # You can't use .shuffle!
    @deck.size.times do |i|
      j=rand(51)
      @deck[i],@deck[j] = deck[j],deck[i]
    end
  end

  # Remove the top card from your deck and return it
  def deal_card
    # i=@first_index
    # res = @deck[i]
    # @deck[i] =nil
    # @first_index+=1
    # i>=51 ? @deck.compact! : nil
    # res
    if @deck[51].nil?
      @deck=@placeholder
      @first_index=0
      @placeholder=[]
    end
    res = @deck[@first_index]
    @deck[@first_index]=nil
    @first_index +=1
    res
  end

  # Reset this deck with 52 cards
  def create_52_card_deck
    while @deck.length < 52
      i=0
      until i>4
        case i
          when i=1
            self.create_cards("Spades")
            i+=1
          when i=2
            self.create_cards("Diamonds")
            i+=1
          when i=3
            self.create_cards("Hearts")
            i+=1
          when i=4
            self.create_cards("Diamonds")
            i+=1
        end
      end
    end
    @deck.shuffle
  end

  def create_cards(suit)
    j=1
    while j<=13
      if j<=10
        rank=j
        value =j
      elsif j ==11
        rank = "J"
        value =j
      elsif j ==12
        rank ="Q"
        value =j
      else
        rank="K"
        value =j
      end
      j+=1
      @deck<< Card.new(rank,value,suit)
    end
  end
# You may or may not need to alter this class
class Player
  def initialize(name)
    @name = name
    @hand = Deck.new
  end
end

class War
  def initialize(player1, player2)
    @deck = Deck.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    # You will need to shuffle and pass out the cards to each player
    @deck.create_52_card_deck
    @player1.hand.deck=@deck.deck[0..25]
    @player1.hand.deck=@deck.deck[26..51]
    # while i<@deck.deck.length
    #   if i%2!=0
    #     @player1.hand.add_card(@deck.deal_card)
    #   else
    #     @player1.hand.add_card(@deck.deal_card)
    #   end
    #   i+=1
    # end
  end

  # You will need to play the entire game in this method using the WarAPI
  def play_game

    WarAPI.play_turn(@player1,@player1.hand.deal_card,@player2,@player2.hand.deal_card)

  end
end


class WarAPI
  # This method will take a card from each player and
  # return a hash with the cards that each player should receive
  def self.play_turn(player1, card1, player2, card2)
    if card1.value > card2.value
      {player1 => [card1, card2], player2 => []}
    elsif card2.value > card1.value #|| Rand(100).even?
      {player1 => [], player2 => [card2, card1]}
    else
      # {player1 => [card1, card2], player2 => []}
    end
  end
end
