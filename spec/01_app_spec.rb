require "spec_helper"

describe CoffeeApp::App do
  subject { described_class.new }
  let(:prices_json) do
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
  end

  let(:orders_json) do
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
  end

  let(:payments_json) do
    <<-JSON
      [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
      ]
    JSON
  end

  let(:expected_result_json) do
    <<-JSON
      [
        { "user": "coach",    "order_total": 8.00, "payment_total": 2.50, "balance": 5.50 },
        { "user": "ellis",    "order_total": 3.25, "payment_total": 3.25, "balance": 0.00 },
        { "user": "rochelle", "order_total": 4.50, "payment_total": 4.50, "balance": 0.00 },
        { "user": "zoey",     "order_total": 6.53, "payment_total": 0.00, "balance": 6.53 }
      ]
    JSON
  end

  context "when prices are added" do
    it "has the correct number of drink objects" do
      subject.add_prices(prices_json)
      expect(subject.prices.length).to eq(6)
    end
  end

  context "when orders are added" do
    it "has the correct number of order objects" do
      subject.add_prices(prices_json)
      subject.add_orders(orders_json)
      expect(subject.orders.length).to eq(6)
    end
  end

  context "when payments are added" do
    it "has the correct number of payment objects" do
      subject.add_payments(payments_json)
      expect(subject.payments.length).to eq(4)
    end
  end

  context "when users are added" do
    it "has the correct number of user objects" do
      subject.add_prices(prices_json)
      subject.add_orders(orders_json)
      subject.add_payments(payments_json)
      subject.add_users
      expect(subject.users.length).to eq(4)
    end
  end

  context "when searching for drink" do
    it "returns the correct drink object" do
      subject.add_prices(prices_json)
      expect(subject.find_drink("supermochacrapucaramelcream").drink_name).to eq("supermochacrapucaramelcream")
      expect(subject.find_drink("supermochacrapucaramelcream").prices[:large]).to eq(5.0)
    end
  end

  context "when calling order_total(user)" do
    it "returns the correct value" do
      subject.add_prices(prices_json)
      subject.add_orders(orders_json)
      expect(subject.order_total("zoey")).to eq(6.53)
    end
  end

  context "when calling payment_total(user)" do
    it "returns the correct value" do
      subject.add_payments(payments_json)
      expect(subject.payment_total("ellis")).to eq(3.25)
    end
  end

  context "when fetching final result" do
    it "returns the correct hash" do
      subject.add_prices(prices_json)
      subject.add_orders(orders_json)
      subject.add_payments(payments_json)
      subject.add_users
      expect(subject.result).to eq(
        [
          { user: "coach", order_total: 8.0, payment_total: 2.5, balance: 5.5 },
          { user: "ellis", order_total: 3.25, payment_total: 3.25, balance: 0.0 },
          { user: "rochelle", order_total: 4.5, payment_total: 4.5, balance: 0.0 },
          { user: "zoey", order_total: 6.53, payment_total: 0, balance: 6.53 },
        ],
      )
    end
  end
end
