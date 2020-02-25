# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #about' do
    it 'returns a success response' do
      get :about
      expect(response).to be_successful
    end
  end

  describe 'GET #check_admin_user' do
    it 'returns a success response' do
      get :check_admin_user, format: :json
      expect(response).to be_successful
    end

    it 'returns a success response' do
      get :check_admin_user, format: :json
      expect(response).to be_successful
    end

    it 'returns true when user admin' do
      sign_in FactoryBot.create(:user, admin: true)
      get :check_admin_user, format: :json
      expect(JSON.parse(response.body)['message']).to eq true
    end

    it 'returns false when user not admin' do
      sign_in FactoryBot.create(:user)
      get :check_admin_user, format: :json
      expect(JSON.parse(response.body)['message']).to eq false
    end
  end
end
