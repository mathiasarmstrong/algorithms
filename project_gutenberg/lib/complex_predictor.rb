require 'rubygems'
require 'fast-stemmer'
require 'classifier'
require 'pry-debugger'
require_relative 'predictor'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @categories = []
    @all_books.each do |category, book|
      @categories<< category unless @categories.include?(category)
    end
    @classifier = Classifier::Bayes.new()
    @categories.each do |categ|
      @classifier.add_category(categ)
    end

    @all_books.each do |category, book|
      read = book.join(' ')
      @classifier.train(category, read)
    end

  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)


    return @classifier.classify(tokens[0..tokens.length/15].join(' ')).to_sym
  end
end

