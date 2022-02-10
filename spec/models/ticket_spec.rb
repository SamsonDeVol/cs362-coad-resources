require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let (:ticket) { build(:ticket) }
  let (:resource_category) { build_stubbed(:resource_category)}
  let (:region) { build_stubbed(:region)}

  describe "attributes" do
    it "has a name" do
      expect(ticket).to respond_to(:name)
    end

    it "has a description" do
      expect(ticket).to respond_to(:description)
    end

    it "has a phone" do
      expect(ticket).to respond_to(:phone)
    end

    it "has a boolean, closed" do
      expect(ticket).to respond_to(:closed)
    end
  end

  describe "associations" do
    it "belongs to a region" do
      expect(ticket).to belong_to(:region)
    end

    it "belongs to a resource category" do
      expect(ticket).to belong_to(:resource_category)
    end

    it "belongs to an organization" do
      expect(ticket).to belong_to(:organization)
    end
  end

  describe "validations" do
    it "must have a name" do
      expect(ticket).to validate_presence_of(:name)
    end
    it "must have a phone" do
      expect(ticket).to validate_presence_of(:phone)
    end
    it "must have a region_id" do
      expect(ticket).to validate_presence_of(:region_id)
    end
    it "must have a resource_category_id" do
      expect(ticket).to validate_presence_of(:resource_category_id)
    end

    it "cannot have a name longer than 255 chars" do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "cannot have a name longer than 255 chars" do
      expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    end

    it "must have a valid phone number" do
      expect(ticket).to allow_value("1 541 555 1454").for(:phone)
      expect(ticket).to_not allow_value("41 555 1454").for(:phone)
      expect(ticket).to_not allow_value("1 541 AAA 1454").for(:phone)
      expect(ticket).to_not allow_value("1 541 5-5 14+4").for(:phone)
    end
  end

  describe "Scope Methods" do

    describe "#open" do
      it "returns array of unclaimed, open tickets" do
        closed_ticket = create(:ticket,
        resource_category: create(:resource_category, name: "f1"),
        region: create(:region, name: "f1"), closed: true)

        open_ticket = create(:ticket,
        resource_category: create(:resource_category, name: "f2"),
        region: create(:region, name: "f2"))

        tickets = Ticket.open
        expect(tickets).to include(open_ticket)
        expect(tickets).to_not include(closed_ticket)
      end
    end

    describe "#closed" do
      it "returns only closed tickets" do
        closed_ticket = create(:ticket, resource_category: resource_category, region: region, closed: true)
        expect(Ticket.closed).to include(closed_ticket)
        expect(Ticket.closed).to_not include(ticket)
      end
    end

    describe "#all_organization" do
      it "returns tickets that are open and have a non nil organization_id" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1)
        expect(Ticket.all_organization).to include(ticket)
      end

      it "doesn't return tickets that are closed" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1, closed: true)
        expect(Ticket.all_organization).to_not include(ticket)
      end

      it "doesn't return tickets that have a nil organization_id" do
        ticket = create(:ticket, resource_category: resource_category, region: region)
        expect(Ticket.all_organization).to_not include(ticket)
      end
    end

    describe "#organization" do
      it "returns tickets that are open and have a specific organization id" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1)
        expect(Ticket.organization(1)).to include(ticket)
      end

      it "doesn't return a ticket that is closed" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1, closed: true)
        expect(Ticket.organization(1)).to_not include(ticket)
      end

      it "doesn't return a ticket with a nil organization id" do
        ticket = create(:ticket, resource_category: resource_category, region: region, closed: true)
        expect(Ticket.organization(1)).to_not include(ticket)
      end
    end

    describe "#closed_organization" do
      it "returns tickets that are closed and have a specific organization id" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1, closed: true)
        expect(Ticket.closed_organization(1)).to include(ticket)
      end

      it "doesn't return a ticket that is open" do
        ticket = create(:ticket, resource_category: resource_category, region: region, organization_id: 1)
        expect(Ticket.closed_organization(1)).to_not include(ticket)
      end

      it "doesn't return a ticket with a nil organization id" do
        ticket = create(:ticket, resource_category: resource_category, region: region)
        expect(Ticket.closed_organization(1)).to_not include(ticket)
      end
    end
  end
end
