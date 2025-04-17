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

    it 'should handle the newlines between the numbers and should give the sum' do
      expect(calc.add("1\n2,3")).to eq(6)
    end

    context 'with custom delimiter' do
      it 'should handle a custom delimiter specified in the beginning' do
        expect(calc.add('//;\n1;2')).to eq(3)
      end
    end
  end
end
