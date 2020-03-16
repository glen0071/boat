class LatestController < ApplicationController
  def index
    @quotes = Quote.all.reverse.take(10)
    @authors = Author.all.reverse.take(10)
    @topics = Topic.all.reverse.take(10)
  end
end
