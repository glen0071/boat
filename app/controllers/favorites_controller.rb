# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def update
    fave = Favorite.find_by(user_id: params[:user_id], quote_id: params[:quote_id])
    if fave.present?
      fave.destroy
    else
      Favorite.create(user_id: params[:user_id], quote_id: params[:quote_id])
    end

    redirect_to quote_path(params[:quote_id])
  end

  def create
    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_user
  end
end
