require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do

    describe "#format_phone_number" do
      
      it "adds US country code" do      
        number = helper.format_phone_number("2223334444")
        expect(number).to eq("+12223334444")
      end

      it "doesn't add an extra country code" do
        number = helper.format_phone_number("+12223334444")
        expect(number).to eq("+12223334444")
      end

      it "adds US country code to alternatice formats" do
        number = helper.format_phone_number("(222)-333-4444")
        expect(number).to eq("+12223334444")
      end
    end
end
