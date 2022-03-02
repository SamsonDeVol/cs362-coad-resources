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

    describe "an organization user" do
      it "redirects to the dashboard" do
        organization_user = create(:user)
        organization_user.confirm
        organization_user.organization.approve
        organization_user.organization.save!
        sign_in(organization_user)

        delete :destroy, params: {id: 'FAKE'}
        expect(response).to redirect_to(dashboard_path)
      end
    end
    
    describe "an unapproved organization user" do
      it "redirects to the dashboard" do
        organization_user = create(:user)
        organization_user.confirm
        organization_user.organization.reject
        organization_user.organization.save!
        sign_in(organization_user)

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
