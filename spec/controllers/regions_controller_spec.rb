require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  describe "a non logged in user" do

    it "redirects to the sign in scrreen" do
      get :index
      expect(response).to redirect_to(new_user_session_path);
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path);
    end
  end

end
