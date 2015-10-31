require 'weighted-select'

RSpec.describe WeightedSelect::Selector do
  describe '#initialize' do
    it 'adds each weighted element' do
      weights = { :a => 40, b: 60 }
      expect_any_instance_of(WeightedSelect::Selector).to receive(:add).twice
      WeightedSelect::Selector.new weights
    end

    it 'accepts empty argument' do
      expect { WeightedSelect::Selector.new }.not_to raise_exception
    end
  end

  describe '#add' do
    let!(:selector) { WeightedSelect::Selector.new(a: 10) }

    context 'when weight not positive' do
      let(:action) { -> { selector.add(:b, 0) } }

      it 'does not change total weight' do
        expect(action).not_to change(selector, :total_weight)
      end

      it 'does not change weights hash' do
        expect(action).not_to change(selector, :weights)
      end
    end

    context 'when weight is positive' do
      let(:action) { -> { selector.add(:b, 15) } }

      it 'increases total weight' do
        expect(action).to change(selector, :total_weight)
      end

      it 'adds item to weights hash' do
        expect(action).to change(selector, :weights)
      end

      it 'uses subsequent interval as key' do
        action.call
        expect(selector.weights.keys.last).to eq(10...25)
      end
    end
  end
end
