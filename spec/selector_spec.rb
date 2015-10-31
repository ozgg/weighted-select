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
    context 'when weight not positive' do
      it 'does not change total weight'
      it 'does not change weights hash'
    end
  end
end
