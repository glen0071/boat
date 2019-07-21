require 'rails_helper'

RSpec.describe DataTransfersController, type: :controller do

  describe "GET #create" do
    it "returns http success in export" do
      get :create, direction: :export
      expect(response).to have_http_status(:success)
    end
  end

end
