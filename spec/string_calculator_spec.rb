# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe "#add" do
    it "should return 0 for the empty string" do
      expect(calc.add("")).to eq(0)
    end

    it 'should return a number when single number input is present' do
      expect(calc.add("5")).to eq(5)
    end

    it 'should sum two comma seprated numbers' do
      expect(calc.add("1,8")).to eq(9)
    end

    it 'should give the sum of any amount of numbers' do
      expect(calc.add("1,4,6,7,8,2")).to eq(28)
    end
  end
end
