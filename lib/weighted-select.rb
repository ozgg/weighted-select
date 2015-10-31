require_relative 'weighted-select/version'

module WeightedSelect
  class Selector
    attr_reader :weights, :total_weight

    # @param [Hash] weights
    def initialize(weights = Hash.new)
      @weights = Hash.new
      @total_weight = 0
      weights.each { |item, weight| add item, weight }
    end

    def add(item, weight)
      delta = Integer(weight)
      if delta > 0
        new_weight = @total_weight + delta
        weights[@total_weight...new_weight] = item
        @total_weight += new_weight
      end
    end
  end
end
