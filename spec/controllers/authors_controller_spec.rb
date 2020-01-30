# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  let!(:author) { FactoryBot.create(:author) }
  let!(:author_attributes) { FactoryBot.attributes_for(:author, name: '21 Savage') }
  let!(:new_attributes) { FactoryBot.attributes_for(:author, name: 'J. Cole', birth: '2000', death: '3000') }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: author.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: author.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Author' do
        expect do
          post :create, params: { author: author_attributes }
        end.to change(Author, :count).by(1)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { author: { name: '' } }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        put :update, params: { id: author.to_param, author: new_attributes }
        author.reload
      end

      it 'updates the requested author' do
        expect(author.name).to eq new_attributes[:name]
        expect(author.birth).to eq new_attributes[:birth]
        expect(author.death).to eq new_attributes[:death]
      end

      it 'redirects to the author' do
        expect(response).to redirect_to(author)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: author.to_param, author: { name: '' } }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested author' do
      expect do
        delete :destroy, params: { id: author.to_param }
      end.to change(Author, :count).by(-1)
    end

    it 'redirects to the authors list' do
      delete :destroy, params: { id: author.to_param }
      expect(response).to redirect_to(authors_url)
    end
  end
end
