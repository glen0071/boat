# frozen_string_literal: true

class TopicsController < ApplicationController
  # before_action :authenticate_user!, except: %i[index show]
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @topics = Topic.all
  end

  def show
    @quotes = @topic.quote_topics.includes(:quote)
    @authors = @topic.authors.joins(:quotes, :quote_topics).group('authors.id').order('count(authors.id) desc')
  end

  def new
    @topic = Topic.new
  end

  def edit
    return redirect_to topic_path, notice: LOCK_NOTICE if current_user_locked_out?(@topic)
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    return redirect_to topic_path, notice: LOCK_NOTICE if current_user_locked_out?(@topic)

    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to topic_path, notice: LOCK_NOTICE if current_user_locked_out?(@topic)

    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end
end
