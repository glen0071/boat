# frozen_string_literal: true

class DataTransfersController < ApplicationController
  before_action :authenticate_user!

  def new
    @data_transfer = DataTransfer.new
  end

  def create
    DataTransfer.create(data_transfer_params)
    render :new, notice: "#{data_transfer_params[:direction]} created successfully"
  end

  def data_transfer_params
    params.require(:data_transfer).permit(:direction)
  end
end
