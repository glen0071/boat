require 'rails_helper'

RSpec.describe "Games", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/games/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /hide_words" do
    it "returns http success" do
      get "/games/hide_words"
      expect(response).to have_http_status(:success)
    end
  end

end
