require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  describe "a non logged in person" do

    it "redirects to the sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "an organization user" do
    it "redirects to the dashboard" do
      organization_user = create(:user)
      organization_user.confirm
      sign_in(organization_user)

      get :index
      expect(response).to redirect_to(dashboard_path)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
