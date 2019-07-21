class SearchController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quotes = Quote.all
  end

  def create
    quotes = Quote.where("lower(text) like ?", "%#{params[:query][:q].downcase}%")
    themes = Theme.where("lower(name) like ?", "%#{params[:query][:q].downcase}%")
    @results = themes + quotes
    render :index
  end

  private

    def query_params
      params.require(:query).permit(:text)
    end
end
