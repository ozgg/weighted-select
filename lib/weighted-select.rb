require_relative 'weighted-select/version'

module WeightedSelect
  class Selector
    attr_reader :weights, :total_weight

    # Sets initial weights
    #
    # Accepts Hash as an argument, where keys are items and corresponding values
    # are their weights (positive integers).
    #
    # @param [Hash] weights
    def initialize(weights = Hash.new)
      @weights = Hash.new
      @total_weight = 0
      weights.each { |item, weight| add item, weight }
    end

    # Add item with weight
    #
    # @param [Object] item
    # @param [Integer] weight
    def add(item, weight)
      delta = Integer(weight)
      if delta > 0
        new_weight = @total_weight + delta
        weights[@total_weight...new_weight] = item
        @total_weight = new_weight
      end
    end

    # Select weighted-random item if where are any in weights hash
    #
    # @return [Object|nil]
    def select
      extract_item unless @weights.empty?
    end

    private

    # Extract item based on weights distribution
    #
    # @return [Object]
    def extract_item
      weight = Random.rand(@total_weight)
      @weights.each do |range, item|
        return item if range === weight
      end
    end
  end
end
