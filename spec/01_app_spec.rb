require "spec_helper"

describe CoffeeApp::App do
  subject { described_class.new() }

  context "when prices are added" do
    it "has the correct number of drink objects" do
      expect(subject.prices.length).to eq(0)
    end
  end

  context "when orders are added" do
    it "has the correct number of order objects" do
      expect(subject.orders.length).to eq(0)
    end
  end

  context "when payments are added" do
    it "has the correct number of payment objects" do
      expect(subject.payments.length).to eq(0)
    end
  end

  context "when users are added" do
    it "has the correct number of user objects" do
      expect(subject.users.length).to eq(0)
    end
  end

  context "when fetching result" do
  end
end
