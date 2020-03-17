# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:quote) { FactoryBot.create(:quote, locked: true, user: FactoryBot.create(:user)) }
  let(:user_created_quote) { FactoryBot.create(:quote, user: user, locked: true) }
  let(:quote_attributes) { FactoryBot.attributes_for(:quote) }
  let(:new_attributes) do
    FactoryBot.attributes_for(:quote,
                              text: 'Love is the secret...',
                              source_title: 'Selections from the Writings...',
                              date: '1800s')
  end

  context 'when logged in, quote is locked' do
    before { sign_in user }

    describe 'GET #edit' do
      context 'quote does not belong to curernt_user' do
        it 'redirects to show page' do
          get :edit, params: { id: quote.to_param }
          expect(response).to redirect_to(quote)
        end
      end

      context 'quote belongs to curernt_user' do
        it 'returns success' do
          get :edit, params: { id: user_created_quote.to_param }
          expect(response).to be_successful
        end
      end
    end

    describe 'PUT #update' do
      context 'quote does not belong to curernt_user' do
        before do
          put :update, params: { id: quote.to_param, quote: new_attributes }
          quote.reload
        end

        it 'redirects to quote show page' do
          expect(response).to redirect_to(quote)
        end
      end

      context 'quote belongs_to current_user' do
        before do
          put :update, params: { id: user_created_quote.to_param, quote: new_attributes }
          user_created_quote.reload
        end

        it 'returns success' do
          expect(response).to redirect_to(user_created_quote)
          expect(user_created_quote.text).to eq new_attributes[:text]
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        quote
        user_created_quote
      end
      context 'quote belongs_to current_user' do
        it 'destroys the requested quote' do
          expect do
            delete :destroy, params: { id: user_created_quote.to_param }
          end.to change(Quote, :count).by(-1)
        end

        it 'redirects to the quotes list' do
          delete :destroy, params: { id: user_created_quote.to_param }
          expect(response).to redirect_to(quotes_url)
        end
      end

      context 'quote does not belong to current_user' do
        it 'destroys the requested quote' do
          expect do
            delete :destroy, params: { id: quote.to_param }
          end.to change(Quote, :count).by(0)
        end

        it 'redirects to the quotes list' do
          delete :destroy, params: { id: quote.to_param }
          expect(response).to redirect_to(quote_path(quote))
        end
      end
    end
  end ## end logged in context
end
