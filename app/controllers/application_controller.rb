# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_query_model

  LOCK_NOTICE = 'This quote has been locked, only its author can edit'

  def load_query_model
    @query = Query.new
  end

  def authenticate_user!
    redirect_to :root unless current_user
  end

  private
  def current_user_locked_out?(resource)
    resource.locked && different_user_created?(resource) ? true : false
  end

  def different_user_created?(resource)
    return false if resource.user.nil?
    resource.user != current_user ? true : false
  end
end
