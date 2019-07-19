class SearchController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quotes = Quote.all
  end

  def create
    # reorder by relevance?
    quotes = Quote.where("lower(text) like ?", "%#{params[:query][:q].downcase}%")
    themes = Theme.where("lower(name) like ?", "%#{params[:query][:q].downcase}%")
    @results = quotes + themes
    render :index
  end

  private

    def query_params
      params.require(:query).permit(:text)
    end
end
