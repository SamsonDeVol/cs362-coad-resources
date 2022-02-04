require 'rails_helper'

RSpec.describe Ticket, type: :model do

  describe "attributes" do
    it "has a name" do
      ticket = Ticket.new
      expect(ticket).to respond_to(:name)
    end
  end
end
