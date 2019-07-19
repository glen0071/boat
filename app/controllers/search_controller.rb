class SearchController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quotes = Quote.all
  end

  def create
    # reorder by relevance?
    quotes = Quote.where("text like ?", "%#{params[:query][:q]}%")
    themes = Theme.where("name like ?", "%#{params[:query][:q]}%")
    @results = quotes + themes
    render :index
  end

  private

    def query_params
      params.require(:query).permit(:text)
    end
end
