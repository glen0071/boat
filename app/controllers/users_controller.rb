# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @fave_quotes = Favorite.includes(:quote).where(user: @user).where.not(quote: nil)
    @fave_topics = Favorite.includes(:topic).where(user: @user).where.not(topics: nil)
    @fave_authors = Favorite.includes(:author).where(user: @user).where.not(authors: nil)
  end

  private

  def set_user
    @user = current_user
  end
end
