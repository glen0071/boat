require 'rails_helper'

RSpec.describe ThemesController, type: :controller do
  let!(:theme) { FactoryBot.create(:theme) }
  let!(:theme_attributes) { FactoryBot.attributes_for(:theme, name: 'Honesty') }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: theme.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: theme.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Theme" do
        expect {
          post :create, params: { theme: theme_attributes }
        }.to change(Theme, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {theme: { name: '' }}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested theme" do
        put :update, params: {id: theme.to_param, theme: theme_attributes}
        theme.reload
        expect(theme.name). to eq theme_attributes[:name]
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: theme.to_param, theme: { name: '' }}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested theme" do
      expect {
        delete :destroy, params: {id: theme.to_param}
      }.to change(Theme, :count).by(-1)
    end
  end
end
