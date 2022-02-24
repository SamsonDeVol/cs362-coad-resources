require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "a non logged in person" do

        it "can access new ticket page" do
          get :new
          expect(response).to be_successful
        end
      end

end
