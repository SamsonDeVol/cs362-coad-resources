require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "a non logged in person" do
        it "redirects to dashboard" do
          get :show, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
          post :capture, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
          post :release, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
          patch :close, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
          delete :destroy, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
        end
      end
end
