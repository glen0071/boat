# frozen_string_literal: true

class QuotesController < ApplicationController
  # before_action :authenticate_user!, except: %i[index show]
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all.shuffle
  end

  def show; end

  def new
    @quote = Quote.new
    @topics = Topic.all.to_json
  end

  def edit
    redirect_to quote_path, notice: LOCK_NOTICE  if current_user_locked_out?(@quote)
  end

  def create
    @quote = Quote.new(quote_params)

    new_author = quote_params.delete(:new_author)
    if new_author.present?
      @quote.author = Author.find_or_create_by(name: new_author)
    end
    
    new_source = quote_params.delete(:new_source)
    if new_source.present?
      @quote.source = Source.find_or_create_by(title: new_source)
    end

    new_topics = quote_params.delete(:new_topics)&.split(',').uniq
    new_topics.each do |topic|
      @quote.topics << Topic.find_or_create_by(name: topic)
    end

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    return redirect_to quote_path, notice: LOCK_NOTICE  if current_user_locked_out?(@quote)

    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to quote_path, notice: LOCK_NOTICE  if current_user_locked_out?(@quote)
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params
    .require(:quote)
    .permit(:text, :source_title, :source_link, :author_id,
      :source_id, :good, :context, :date, :page, :new_author, :new_source,
      :locked, :new_topics, topic_ids: [])
  end
end
