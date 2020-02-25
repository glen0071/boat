# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  before do
    sign_in FactoryBot.create(:user)
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/favorites/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/favorites/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
