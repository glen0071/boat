require 'rails_helper'

RSpec.describe DataTransferService, type: :service do
  Author.destroy_all
  FactoryBot.create_list(:author, 10)

  describe ".new" do
    DataTransferService.new('export', nil).export
  end

  # describe "#export" do
  #   DataTransferService.new(file_path).export
  # end
end
