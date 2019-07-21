require 'rails_helper'

RSpec.describe ThemesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Theme. As you add validations to Theme, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ThemesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Theme.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      theme = Theme.create! valid_attributes
      get :show, params: {id: theme.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      theme = Theme.create! valid_attributes
      get :edit, params: {id: theme.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Theme" do
        expect {
          post :create, params: {theme: valid_attributes}, session: valid_session
        }.to change(Theme, :count).by(1)
      end

      it "redirects to the created theme" do
        post :create, params: {theme: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Theme.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {theme: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested theme" do
        theme = Theme.create! valid_attributes
        put :update, params: {id: theme.to_param, theme: new_attributes}, session: valid_session
        theme.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the theme" do
        theme = Theme.create! valid_attributes
        put :update, params: {id: theme.to_param, theme: valid_attributes}, session: valid_session
        expect(response).to redirect_to(theme)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        theme = Theme.create! valid_attributes
        put :update, params: {id: theme.to_param, theme: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested theme" do
      theme = Theme.create! valid_attributes
      expect {
        delete :destroy, params: {id: theme.to_param}, session: valid_session
      }.to change(Theme, :count).by(-1)
    end

    it "redirects to the themes list" do
      theme = Theme.create! valid_attributes
      delete :destroy, params: {id: theme.to_param}, session: valid_session
      expect(response).to redirect_to(themes_url)
    end
  end

end
