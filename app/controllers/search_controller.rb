# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quotes = Quote.all
  end

  def create
    quotes = Quote.where('lower(text) like ?', "%#{params[:query][:q].downcase}%")
    topics = Topic.where('lower(name) like ?', "%#{params[:query][:q].downcase}%")
    topic_descriptions = Topic.where('lower(description) like ?', "%#{params[:query][:q].downcase}%")
    authors = Author.where('lower(name) like ?', "%#{params[:query][:q].downcase}%")
    @results = (topics + topic_descriptions + quotes + authors).uniq
    render :index
  end

  private

  def query_params
    params.require(:query).permit(:text)
  end
end
