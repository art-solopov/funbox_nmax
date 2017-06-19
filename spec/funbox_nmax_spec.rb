require "spec_helper"

RSpec.describe FunboxNmax do
  it "has a version number" do
    expect(FunboxNmax::VERSION).not_to be nil
  end

  describe 'returns the maximum n numbers' do
    let(:str) { '10 20 30 40 50 100 120 140' }
    subject { FunboxNmax.n_max(3, StringIO.new(str)) }

    it { expect(subject).to eq([140, 120, 100]) }

    describe 'long numbers' do
      let(:str) do
        '1' + '0' * 999 + ' ' + '5' + '0' * 300 + ' ' + '9' * 120
      end

      it { expect(subject).to eq([10**999, 5 * 10**300, (10**120 - 1)]) }
    end
  end
end
