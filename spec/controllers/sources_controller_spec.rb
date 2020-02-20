# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SourcesController, type: :controller do
  let(:source) { FactoryBot.create(:source) }
  let(:new_source) { FactoryBot.attributes_for(:source) }
  let(:bad_source) { FactoryBot.attributes_for(:source, title: nil) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: source.to_param }
      expect(response).to be_successful
    end
  end

  context 'login admin' do
    before do
      sign_in FactoryBot.create(:user)
    end
    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: source.to_param }
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Source' do
          expect do
            post :create, params: { source: new_source }
          end.to change(Source, :count).by(1)
        end

        it 'redirects to the created source' do
          post :create, params: { source: new_source }
          expect(response).to redirect_to(Source.last)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { source: bad_source }
          expect(response).to be_successful
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:changed_source) do
          FactoryBot.attributes_for(:source, title: 'new title', alt_title: 'new alt title')
        end

        it 'updates the requested source' do
          put :update, params: { id: source.to_param, source: changed_source }
          source.reload
          expect(source.title).to eq 'new title'
        end

        it 'redirects to the source' do
          put :update, params: { id: source.to_param, source: changed_source }
          expect(response).to redirect_to(source)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: source.to_param, source: bad_source }
          expect(response).to be_successful
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        source
      end
      it 'destroys the requested source' do
        expect do
          delete :destroy, params: { id: source.to_param }
        end.to change(Source, :count).by(-1)
      end

      it 'redirects to the sources list' do
        delete :destroy, params: { id: source.to_param }
        expect(response).to redirect_to(sources_url)
      end
    end
  end
end
