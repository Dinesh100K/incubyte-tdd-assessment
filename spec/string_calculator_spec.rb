# frozen_string_literal: true

describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe "#add" do
    it "should return 0 for the empty string" do
      expect(calc.add("")).to eq(0)
    end
  end
end
