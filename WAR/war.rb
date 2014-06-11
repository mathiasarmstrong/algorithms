# # This class is complete. You do not need to alter this

class Card
  # Rank is the rank of the card, 2-10, J, Q, K, A
  # Value is the numeric value of the card, so J = 11, A = 14
  # Suit is the suit of the card, Spades, Diamonds, Clubs or Hearts'
  attr_accessor :rank, :value, :suit
  def initialize(rank, value, suit)
    @rank = rank
    @value = value
    @suit = suit
  end
  def translate
    return "#{@rank} of #{@suit}"
  end
end

class Linked_list

  attr_reader :first_node, :last_node

  def initialize(value=nil)
      @first_node = Node.new(value) if !value.nil?
      @last_node=first_node
  end

  def add_node(value)
    if first_node.nil?
      @first_node=Node.new(value)
      @last_node = @first_node
    else
      @last_node.next_node = Node.new(value)
      @last_node = @last_node.next_node
    end
  end

  def remove_first_node
    new_first_node = @first_node.next_node
    @first_node.next_node=nil
    @first_node = new_first_node
  end

  class Node
    attr_accessor :value, :next_node
    def initialize(value,next_node=nil)
      @value = value
      @next_node = next_node
    end
  end
end

# TODO: You will need to complete the methods in this class
class Deck

  attr_accessor :deck, :deck_length

  def initialize
    @deck = Linked_list.new # Determine the best way to hold the cards
    @deck_length=0
  end

 # create 13 cards for a specific suit of card
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
      self.add_card(Card.new(rank,value,suit))
    end
  end

 # Mix around the order of the cards in your deck
  def shuffle # You can't use .shuffle!

    (@deck_length-1).times do |i|
      shuffle_node1 = @deck.first_node

      i.times do
        shuffle_node1 = shuffle_node1.next_node
        shuffle_node1.nil? ? shuffle_node1 = @deck.first_node : nil
      end

      j=rand(@deck_length-(i+1))
      shuffle_node2 = @deck.first_node

      j.times do |k|
        shuffle_node2 = shuffle_node2.next_node
        shuffle_node2.nil? ? shuffle_node2 = @deck.first_node : nil
      end

      temporary_node1 = shuffle_node1.next_node
      temporary_node2 = shuffle_node2.next_node
      shuffle_node2.next_node = temporary_node1
      shuffle_node1.next_node = temporary_node2
    end
  end

 # add 52 cards to the deck and shuffle them
  def create_52_card_deck
    # @temporary_deck = []
    4.times do |i|
      case i
        when i=0
          self.create_cards("Spades")
        when i=1
          self.create_cards("Diamonds")
        when i=2
          self.create_cards("Hearts")
        when i=3
          self.create_cards("Diamonds")
      end
    end
    self.shuffle
  end

 # Given a card, insert it on the bottom your deck
  def add_card(card)
    @deck.add_node(card)
    @deck_length+=1
  end

 # Remove the top card from your deck and return it
  def deal_card
    dealt_card = @deck.first_node
    @deck.remove_first_node
    @deck_length-=1
    dealt_card
  end
end

 # You may or may not need to alter this class
class Player
  attr_reader :name, :hand
  def initialize(name)
    @name = name
    @hand = Deck.new
  end
  def add_to_hand(card)
    @hand.add_card(card)
  end
  def deal_card
    @hand.deal_card
  end
end

class War
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @deck = Deck.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    # You will need to shuffle and pass out the cards to each player
    @deck.create_52_card_deck
    # binding.pry
    while @deck_length>0
      rand(2)==0 ? @player1.add_to_hand(@deck.deal_card) : @player2.add_to_hand(@deck.deal_card)
    end
  end
  # You will need to play the entire game in this method using the WarAPI
  def play_game
    loot = WarAPI.play_turn(@player1,@player1.deal_card,@player2,@player2.deal_card)
    loot.each do |key, value|
      value.each{|card| key.hand.add_card(card)}
    end
  end
end

class WarAPI
  # This method will take a card from each player and
  # return a hash with the cards that each player should receive
  def self.play_turn(player1, card1, player2, card2)
    if card1.nil? || card2.nil?
      self.winner(player1, card1, player2, card2)
    elsif !card1.is_a?(Array)
     (card1,card2=[card1],[card2])
    end
    # binding.pry
    if card1[-1].value > card2[-1].value
      puts "#{player1.name}: #{card1[-1].translate}\n#{player2.name}: #{card2[-1].translate}\n#{player1.name} wins this round"
      {player1 => card1+card2, player2 => []}
    elsif card2[-1].value > card1[-1].value
      puts "#{player1.name}: #{card1[-1].translate}\n#{player2.name}: #{card2[-1].translate}\n#{player2.name} wins this round"
      {player1 => [], player2 => card2+card1}
    elsif card1[-1]==card2[-1]
      puts "#{player1.name}: #{card1[-1].translate}\n#{player2.name}: #{card2[-1].translate}\nthis is WAR!!"
      self.war
    end
  end
  def self.war(player1,card1,player2,card2)
    4.times do |i|
      card1<<player1.hand.deal_card
    end
    4.times do |i|
      card2<<player2.hand.deal_card
    end
    loot = WarAPI.play_turn(@player1,card1,@player2,card2)
  end
  def self.winner(player1, card1, player2, card2)
    card1.nil? ? (puts "#{player2.name} has won the game") : (puts "#{player1.name} has won the game")
  end
end
