require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "a non logged in person" do
        it "redirects to dashboard" do
          get :show, params: {id: 'FAKE'}
          expect(response).to redirect_to(dashboard_path)
          # post :capture, params: {id: 'FAKE'}
          # post :release, params: {id: 'FAKE'}
          # patch :close, params: {id: 'FAKE'}
          # delete :destroy, params: {id: 'FAKE'}
        end
      end
end
