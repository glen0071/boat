class GamesController < ApplicationController
  def index
  end

  def hide_words
    @quote = Quote.first
  end
end
