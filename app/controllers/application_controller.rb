class ApplicationController < ActionController::Base

  before_action :load_query_model

 def load_query_model
   @query = Query.new
 end

 def authenticate_user!
   redirect_to :root unless current_user
 end
end
