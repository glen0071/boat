# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def writings; end

  def check_admin_user
    if current_user&.admin?
      render json: { logged_in: true }, layout: false
    else

      render json: { logged_in: false }, layout: false
    end
  end
end
