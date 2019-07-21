class HomeController < ApplicationController
  def index
    @quote = Quote.limit(1).order("RANDOM()").first
  end

  def about; end
end
