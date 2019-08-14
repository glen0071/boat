class HomeController < ApplicationController
  def index
    @hide_search = true
    @topics = Topic.all
  end

  def about
    @quote = Quote.where(good: true).limit(1).order("RANDOM()").first
  end
end
