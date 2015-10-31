require_relative 'weighted-select/version'

module WeightedSelect
  class Selector
    attr_reader :weights, :total_weight

    def initialize(weights = Hash.new)
      @weights = Hash.new
      @total_weight = 0
      weights.each { |item, weight| add item, weight }
    end

    def add(item, weight)

    end
  end
end
