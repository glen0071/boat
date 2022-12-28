# frozen_string_literal: true

class AuthorsController < ApplicationController
  # before_action :authenticate_user!, except: %i[index show]
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @topics = Topic.all
    @authors = if params[:filter].present?
                 Topic.find_by(name: params[:filter]).authors.order(:name)
               else
                 Author.all.order(:name)
               end
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)
    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :birth, :death)
  end
end
