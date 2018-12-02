require "spec_helper"

describe CoffeeApp::Order do
  subject { described_class.new(user: "coach", drink: "long black", size: "medium", amount: 3.50) }

  context "when initalised" do
    it "has the correct user" do
      expect(subject.user).to eq("coach")
    end
    it "has the correct drink" do
      expect(subject.drink).to eq("long black")
    end
    it "has the correct size" do
      expect(subject.size).to eq("medium")
    end
    it "has the correct amount" do
      expect(subject.amount).to eq(3.50)
    end
  end
end
