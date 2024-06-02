require './string_calculator'

describe StringCalculator do

  subject(:calculator) { described_class.new }

  describe 'add' do
    context 'should accept a string' do
      it 'should not raise any error' do
        expect{ calculator.add('1,2,3') }.not_to raise_error
      end
    end

    context 'given input other than string type' do
      it 'should raise error' do
        expect { calculator.add(123) }.to raise_error('Only accept string as an input')
        expect { calculator.add(['123']) }.to raise_error('Only accept string as an input')
      end
    end

    context 'given an empty string' do
      it 'should return 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'without any delimeter' do
      it 'should return same number' do
        expect(calculator.add('12')).to eq(12)
      end
    end

    context 'with comma delimeter' do
      it 'should return sum of numbers' do
        expect(calculator.add('3, 5, 3')).to eq(11)
      end
    end

    context 'with new line delimeter' do
      it 'should return sum of numbers' do
        expect(calculator.add('3\n5\n3')).to eq(11)
      end
    end

    context 'with multiple delimeter' do
      it 'should return sum of numbers' do
        expect(calculator.add('3;\n5;\n3')).to eq(11)
      end
    end

    context 'with predefined delimiters' do
      it 'should return sum of numbers' do
        expect(calculator.add('//;\n3;5;3')).to eq(11)
      end
    end

    context 'with delimeter of n lengths' do
      it 'should return sum of numbers' do
        expect(calculator.add('//[***]\n3***5***3')).to eq(11)
      end
    end

    context 'with negative values' do
      it 'should raise error with negative numbers' do
        expect { calculator.add('3;-5;3;-9') }.to raise_error('Negative numbers not allowed <-5, -9>')
      end
    end

    context 'with number greater 1000' do
      it 'should return sum of numbers less than equal to 1000' do
        expect(calculator.add('3;5;3;1001;2000')).to eq(11)
      end
    end
  end
end