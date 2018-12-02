require "spec_helper"

describe CoffeeApp::User do
  subject { described_class.new(name: "coach") }

  context "when initalised" do
    it "has the correct name" do
      expect(subject.name).to eq("coach")
    end
  end
end
