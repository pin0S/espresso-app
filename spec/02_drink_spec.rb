require "spec_helper"

describe CoffeeApp::Drink do
  subject { described_class.new(drink_name: "short espresso", prices: { small: 3.03 }) }

  context "when initalised" do
    it "has the correct drink name" do
      expect(subject.drink_name).to eq("short espresso")
    end
    it "has the correct prices" do
      expect(subject.prices).to eq(small: 3.03)
    end
    it "can return the correct price from size" do
      expect(subject.price(:small)).to eq(3.03)
    end
  end
end
