class DataTransfersController < ApplicationController
  def create
    DataTransfer.create(data_transfer_params)
  end

  def new
    @data_transfer = DataTransfer.new
  end

  def data_transfer_params
    params.require(:data_transfer).permit(:direction)
  end
end
