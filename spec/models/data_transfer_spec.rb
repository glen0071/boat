require 'rails_helper'

RSpec.describe DataTransfer, type: :model do
  let(:import) { FactoryBot.build(:data_transfer) }

  describe "#persisted?" do
    it "returns false" do
      expect(import.persisted?).to eq false
    end
  end
end
