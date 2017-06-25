require "spec_helper"

RSpec.describe FunboxNmax do
  it "has a version number" do
    expect(FunboxNmax::VERSION).not_to be nil
  end

  let(:str) { '10 20 30 40 50 100 120 140' }

  describe '#n_max' do
    subject { FunboxNmax.n_max(3, StringIO.new(str)) }

    it { expect(subject).to eq([140, 120, 100]) }
  end

  describe 'numbers_from_io' do
    subject { FunboxNmax.to_enum(:numbers_from_io, StringIO.new(str)).to_a }

    it { expect(subject).to eq([10, 20, 30, 40, 50, 100, 120, 140]) }

    describe 'long numbers' do
      let(:str) do
        '1' + '0' * 999 + ' ' + '5' + '0' * 300 + ' ' + '9' * 120
      end

      it { expect(subject).to eq([10**999, 5 * 10**300, (10**120 - 1)]) }
    end

    describe 'numbers starting with zero' do
      let(:str) { '012 7 6 08 0X 00 091' }
      it { expect(subject).to eq([12, 7, 6, 8, 0, 0, 91]) }
    end

    describe 'empty string' do
      let(:str) { '' }
      it { expect(subject).to eq([]) }
    end
  end
end
