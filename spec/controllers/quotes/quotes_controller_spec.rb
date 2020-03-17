# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:quote) { FactoryBot.create(:quote) }
  let(:quote_attributes) { FactoryBot.attributes_for(:quote) }
  let(:new_attributes) do
    FactoryBot.attributes_for(:quote,
                              text: 'Love is the secret...',
                              source_title: 'Selections from the Writings...',
                              date: '1800s')
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: quote.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Quote' do
        expect do
          post :create, params: { quote: quote_attributes }
        end.to change(Quote, :count).by(1)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { quote: { text: '' } }
        expect(response).to be_successful
      end
    end
  end

  context 'when logged in' do
    before { sign_in user }

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: quote.to_param }
        expect(response).to be_successful
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        before(:each) do
          put :update, params: { id: quote.to_param, quote: new_attributes }
          quote.reload
        end

        it 'updates the requested quote' do
          expect(quote.text).to eq new_attributes[:text]
        end

        it 'redirects to the quote' do
          expect(response).to redirect_to(quote)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: quote.to_param, quote: { text: '' } }
          expect(response).to be_successful
        end
      end
    end
  end ## end logged in context

  context 'not signed in' do
    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Quote' do
          expect do
            post :create, params: { quote: quote_attributes }
          end.to change(Quote, :count).by(1)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { quote: { text: '' } }
          expect(response).to be_successful
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        before(:each) do
          put :update, params: { id: quote.to_param, quote: new_attributes }
          quote.reload
        end

        it 'updates the requested quote' do
          expect(quote.text).to eq new_attributes[:text]
        end

        it 'redirects to the quote' do
          expect(response).to redirect_to(quote)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: quote.to_param, quote: { text: '' } }
          expect(response).to be_successful
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        quote
      end
      it 'destroys the requested quote' do
        expect do
          delete :destroy, params: { id: quote.to_param }
        end.to change(Quote, :count).by(-1)
      end

      it 'redirects to the quotes list' do
        delete :destroy, params: { id: quote.to_param }
        expect(response).to redirect_to(quotes_url)
      end
    end
  end ## end not logged in context
end
