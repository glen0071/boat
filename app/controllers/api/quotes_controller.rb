class Api::QuotesController < ApplicationController
  respond_to :json

  def index
    respond_with Quote.all, each_serializer: Api::QuoteSerializer
  end

  def edit
    @quote = Quote.find(params[:id]).includes(:topics)
    # @left_over_topics = Topic.all - @quote_topics
  end
end
