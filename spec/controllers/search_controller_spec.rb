require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, params: {query: { q: 'Truth' } }
      expect(response).to have_http_status(:success)
    end

    it "returns matching topics and quotes" do
      
    end
  end

end
