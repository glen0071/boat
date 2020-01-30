# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rand_quote = Quote.where(good: true).sample
    @hide_search = true
    @topics = Topic.all
  end

  def about
    @quote = Quote.where(good: true).limit(1).order('RANDOM()').first
  end
end
