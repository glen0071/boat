require 'rails_helper'

RSpec.describe "MnData", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mn_data/index"
      expect(response).to have_http_status(:success)
    end
  end

end
