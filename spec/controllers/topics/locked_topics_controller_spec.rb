# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:topic) do
    FactoryBot.create(:topic,
                      locked: true, user: FactoryBot.create(:user)) end
  let(:user_created_topic) { FactoryBot.create(:topic, locked: true) }
  let(:topic_attributes) { FactoryBot.attributes_for(:topic, name: 'Honesty') }

  context 'with user logged in, topic locked' do
    before { sign_in FactoryBot.create(:user) }

    describe 'GET #edit' do
      context 'topic does not belong to user' do
        it 'redirects to topic page' do
          get :edit, params: { id: topic.to_param }
          expect(response).to redirect_to(topic)
        end

        context 'topic belongs_to user' do
          it 'returns succes response' do
            get :edit, params: { id: user_created_topic.to_param }
            expect(response).to be_successful
          end
        end
      end
    end

    describe 'PUT #update' do
      context 'topic does not belong to user' do
        context 'with valid params' do
          it 'does not update the requested topic' do
            put :update, params: { id: topic.to_param, topic: topic_attributes }
            topic.reload
            expect(topic.name).not_to eq topic_attributes[:name]
          end
        end

        context 'with invalid params' do
          it 'redirects to topic show page' do
            put :update, params: { id: topic.to_param, topic: { name: '' } }
            expect(response).to redirect_to(topic)
          end
        end
      end

      context 'topic belongs_to user' do
        context 'with valid params' do
          it 'updates the requested topic' do
            put :update, params: { id: user_created_topic.to_param, topic: topic_attributes }
            user_created_topic.reload
            expect(user_created_topic.name).to eq topic_attributes[:name]
          end
        end

        context 'with invalid params' do
          it "returns a success response (i.e. to display the 'edit' template)" do
            put :update, params: { id: user_created_topic.to_param, topic: { name: '' } }
            expect(response).to be_successful
          end
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        topic
        user_created_topic
      end

      context 'topic does not belong to current_user' do
        it 'destroys the requested topic' do
          expect do
            delete :destroy, params: { id: topic.to_param }
          end.to change(Topic, :count).by(0)
        end
      end

      context 'topic belongs_to current_user' do
        it 'destroys the requested topic' do
          expect do
            delete :destroy, params: { id: user_created_topic.to_param }
          end.to change(Topic, :count).by(-1)
        end
      end
    end
  end
end
