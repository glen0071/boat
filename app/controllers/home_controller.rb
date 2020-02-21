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

  def check_admin_user
    if current_user&.admin?
      render json: { logged_in: true }, layout: false
    else

      render json: { logged_in: false }, layout: false
    end
  end
end
