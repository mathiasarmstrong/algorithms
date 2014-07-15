require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}
    all_words = Hash.new(0)
    categories = {}



    @all_books.each do |category, book|
      book.each do |word|
        all_words[word]+=1
        category_words[category][word]+=1
        categories[category]=Hash.new(0)
      end
    end



  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Always predict astronomy, for now.
    :astronomy
  end
end

