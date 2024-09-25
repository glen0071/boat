require 'rails_helper'

RSpec.describe "CarceralData", type: :request do
  describe "GET /hennepin" do
    it "returns http success" do
      get "/carceral_data/hennepin"
      expect(response).to have_http_status(:success)
    end
  end

end
