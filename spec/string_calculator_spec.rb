# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe '#add' do
    it 'should return 0 for the empty string' do
      expect(calc.add('')).to eq(0)
    end

    it 'should return a number when single number input is present' do
      expect(calc.add('5')).to eq(5)
    end

    it 'should sum two comma separated numbers' do
      expect(calc.add('1,8')).to eq(9)
    end

    it 'should give the sum of any amount of numbers' do
      expect(calc.add('1,4,6,7,8,2')).to eq(28)
    end

    it 'should handle the newlines between the numbers and should give the sum' do
      expect(calc.add("1\n2,3")).to eq(6)
    end

    context 'with custom delimiter' do
      it 'should handle a custom delimiter specified in the beginning' do
        expect(calc.add("//;\n1;2")).to eq(3)
      end

      it 'should handle a custom delimiter with multiple numbers' do
        expect(calc.add("//;\n1;2;3;4")).to eq(10)
      end

      it 'should handle a custom delimiter with newline' do
        expect(calc.add("//;\n1;2\n3;4")).to eq(10)
      end
    end

    context 'with negative numbers' do
      it 'raises on a single negative' do
        expect { calc.add('-1,2') }.to raise_error(ArgumentError, 'negative numbers not allowed -1')
      end

      it 'lists all negatives' do
        expect { calc.add('-1,-4,3') }.to raise_error(ArgumentError, 'negative numbers not allowed -1,-4')
      end
    end
  end

  describe 'validate input numbers' do
    it 'gives an error if negative numbers are passed in input' do
      expect { calc.add('1,2,-3,-4') }.to raise_error(ArgumentError, 'negative numbers not allowed -3,-4')
    end

    it 'does not raise error if all numbers are positive' do
      expect { calc.add('1,2') }.not_to raise_error
    end
  end

  describe 'edge cases' do
    it 'should handle a single newline character' do
      expect(calc.add("\n")).to eq(0)
    end

    it 'should handle multiple newline characters' do
      expect(calc.add("\n\n")).to eq(0)
    end

    it 'should handle a custom delimiter with a single character' do
      expect(calc.add("//a\n1a2")).to eq(3)
    end

    it 'should handle a custom delimiter with a special character' do
      expect(calc.add("//$\n1$2")).to eq(3)
    end
  end
end
