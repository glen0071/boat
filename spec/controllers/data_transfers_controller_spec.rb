# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DataTransfersController, type: :controller do
  describe 'GET #create' do
    it 'returns http success in export' do
      get :create, params: { data_transfer: { direction: 'export' } }
      expect(response).to have_http_status(:success)
    end
  end
end
