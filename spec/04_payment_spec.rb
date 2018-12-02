require "spec_helper"

describe CoffeeApp::Payment do
  subject { described_class.new(user: "coach", amount: 2.50) }

  context "when initalised" do
    it "has the correct user" do
      expect(subject.user).to eq("coach")
    end
    it "has the correct drink" do
      expect(subject.amount).to eq(2.50)
    end
  end
end
