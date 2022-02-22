require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  describe "a non logged in user" do

    it "redirects to the sign in scrreen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end

#   describe "an organization user" do
#     before do
#       allow(controller).to receive(:current_user).and_return(create(:user, :organization))
#       allow(controller).to receive(:user_signed_in?).and_return(true)
#     end

#     it "redirects to the sign in screen" do
#       sign_in(create(:user)).
#       get :index
#       expect(response).to redirect_to(dashboard_path)
#     end
#   end
end
