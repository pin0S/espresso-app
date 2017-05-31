require 'spec_helper'
require 'coffee_app'

RSpec.describe "integration" do
  let(:prices_json) {
    <<-JSON
      [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
    JSON
  }

  let(:orders_json) {
    <<-JSON
      [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    JSON
  }

  let(:payments_json) {
    <<-JSON
      [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
      ]
    JSON
  }

  let(:expected_result_json) {
    <<-JSON
      [
        { "user": "coach",    "order_total": 8.00, "payment_total": 2.50, "balance": 5.50 },
        { "user": "ellis",    "order_total": 3.25, "payment_total": 3.25, "balance": 0.00 },
        { "user": "rochelle", "order_total": 4.50, "payment_total": 4.50, "balance": 0.00 },
        { "user": "zoey",     "order_total": 6.53, "payment_total": 0.00, "balance": 6.53 }
      ]
    JSON
  }

  describe CoffeeApp do
    subject(:result) do
      json_result = CoffeeApp.call(prices_json, orders_json, payments_json)
      JSON.load(json_result)
    end

    it "outputs JSON in expected form" do
      expect(result).to eq JSON.load(expected_result_json)
    end

    it "has a bunch of users who have ordered coffee" do
      expect(result[0]["user"]).to eq "coach"
      expect(result[1]["user"]).to eq "ellis"
      expect(result[2]["user"]).to eq "rochelle"
      expect(result[3]["user"]).to eq "zoey"
    end

    it "has order totals for each user" do
      expect(result[0]["order_total"]).to eq 8.00 # coach: 3.50 + 4.50 = 8.00
      expect(result[1]["order_total"]).to eq 3.25 # ellis: 3.25
      expect(result[2]["order_total"]).to eq 4.50 # rochelle: 4.50
      expect(result[3]["order_total"]).to eq 6.53 # zoey: 3.50 + 3.03 = 6.53
    end

    it "has payment totals for each user" do
      expect(result[0]["payment_total"]).to eq 2.50 # coach: 2.50
      expect(result[1]["payment_total"]).to eq 3.25 # ellis: 2.60 + 0.65
      expect(result[2]["payment_total"]).to eq 4.50 # rochelle: 4.50
      expect(result[3]["payment_total"]).to eq 0.00 # zoey: no payments
    end

    it "has current balance for each user" do
      expect(result[0]["balance"]).to eq 5.50 # coach: 8.00 - 2.50
      expect(result[1]["balance"]).to eq 0.00 # ellis: 3.25 - 3.25
      expect(result[2]["balance"]).to eq 0.00 # rochelle: 4.50 - 4.50
      expect(result[3]["balance"]).to eq 6.53 # zoey: 6.53
    end
  end

end
