require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "not loggined in person" do
    it "redirects to log in page" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
