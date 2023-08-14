require 'rails_helper'

RSpec.describe "Trends", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/trends/index"
      expect(response).to have_http_status(:success)
    end
  end

end
