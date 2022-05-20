require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(8){('A'..'Z').to_a.sample}
    # raise
  end

  def score
    @longest_word = params[:word].upcase
    @checked_word = read_api(@longest_word)
    # if @checked_word == "true"
    # raise
  end

  private

  def read_api(word)
    api_word = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(api_word.read)
    json["found"]
  end
end

# la linea 18 lleva la palabra a la API, la API nos va a dar un hash(uno de los values de este va a ser la palabra) y luego parseamos ese hash
