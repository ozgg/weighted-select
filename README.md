Weighted select
===============

Allows you to store random items with their weight and select them later based on weights.

Usage
-----

    require 'weighted-select'
    
    # a/b/c/d relate as 10/4/1/16
    weights  = { a: 10, b: 4, c: 1, d: 16 }
    selector = WeightedSelect::Selector.new weights
    
    # One can add some more items later
    selector.add :e, 5
    selector.add :f, 3
    
    # One can increase weight by adding the same item again
    selector.add :c, 4
    
    selector.weights 
    # { 
    #   (0...10)  => :a, 
    #   (10...14) => :b, 
    #   (14...15) => :c, 
    #   (15...31) => :d, 
    #   (31...36) => :e, 
    #   (36...39) => :f, 
    #   (39...43) => :c
    # }
    
    # Returns random item based on weights 
    selector.select
    
Anything can be an item. Weight must be positive integer. 
Total weight of all items is stored in `selector.total_weight`.
