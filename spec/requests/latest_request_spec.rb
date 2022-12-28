require 'rails_helper'

RSpec.describe 'Latests', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/latest/index'
      expect(response).to have_http_status(:success)
    end
  end
end
