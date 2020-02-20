# frozen_string_literal: true

class SourcesController < ApplicationController
  # before_action :authenticate_user!, except: %i[index show]
  before_action :set_source, only: %i[show edit update destroy]

  def index
    @sources = Source.all
  end

  def show; end

  def new
    @source = Source.new
  end

  def edit; end

  def create
    @source = Source.new(source_params)

    if @source.save
      redirect_to @source, notice: 'Source was successfully created.'
    else
      render :new
    end
  end

  def update
    if @source.update(source_params)
      redirect_to @source, notice: 'Source was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @source.destroy
    redirect_to sources_url, notice: 'Source was successfully destroyed.'
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(:title, :alt_title, :location, :notes,
                                   :author_id, :pub_date)
  end
end
