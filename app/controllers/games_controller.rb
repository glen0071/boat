# frozen_string_literal: true

class GamesController < ApplicationController
  def study_quote
    @quote = Quote.find(params[:quote_id])
  end
end
