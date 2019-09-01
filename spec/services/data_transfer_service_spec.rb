require 'rails_helper'

RSpec.describe DataTransferService, type: :service do
  # Author.destroy_all
  # FactoryBot.create_list(:author, 10)

  describe ".new" do
    DataTransferService.new('export', nil).export
  end

  describe "#import" do
    # DataTransferService.new('import', "11-Aug-2019_14_39_40").import
  end
end
