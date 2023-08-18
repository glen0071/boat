# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy learn]

  def home
    @rand_quote = Quote.where(good: true).sample
    @hide_search = true
    @topics = Topic.all
  end

  def index
    @quotes = if params[:filter] === 'random'
      Quote.order('RANDOM()').limit(10)
    else
      Quote.order(created_at: :desc).limit(10)
    end
  end

  def show
    @quote.decorate_quote(current_user) if current_user.present?
  end

  def new
    @quote = Quote.new
    @topics = Topic.all.to_json
  end

  def edit
    redirect_to quote_path, notice: LOCK_NOTICE if current_user_locked_out?(@quote)
  end

  def create
    @quote = Quote.new(quote_params)

    new_author = quote_params.delete(:new_author)
    @quote.author = Author.find_or_create_by(name: new_author) if new_author.present?

    new_source = quote_params.delete(:new_source)
    @quote.source = Source.find_or_create_by(title: new_source) if new_source.present?

    new_topics = quote_params.delete(:new_topics)&.split(',')&.uniq
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
    return redirect_to quote_path, notice: LOCK_NOTICE if current_user_locked_out?(@quote)

    new_topics = quote_params.delete(:new_topics)&.split(',')&.uniq
    new_author = quote_params.delete(:new_author)
    new_source = quote_params.delete(:new_source)

    @quote.assign_attributes(quote_params)

    @quote.author = Author.find_or_create_by(name: new_author) if new_author.present?
    @quote.source = Source.find_or_create_by(title: new_source) if new_source.present?

    respond_to do |format|
      if @quote.save
        new_topics.each { |topic| @quote.topics << Topic.find_or_create_by(name: topic) }
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def learn; end

  def about
    @quote = Quote.where(good: true).limit(1).order('RANDOM()').first
  end

  def destroy
    return redirect_to quote_path, notice: LOCK_NOTICE if current_user_locked_out?(@quote)

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
      .permit(:text, :source_link, :author_id,
              :source_id, :good, :context, :date, :page, :new_author, :new_source,
              :locked, :new_topics, topic_ids: [])
  end
end
