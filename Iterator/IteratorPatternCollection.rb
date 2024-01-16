# Concrete Iterator
class ConcreteIterator
    def initialize(aggregate)
        @aggregate = aggregate
        @index = 0
    end

    def has_next?
        @index < @aggregate.data.size
    end

    def next
    raise IndexError unless has_next?
        value = @aggregate.data[@index]
        @index += 1
        value
    end
end

# Concrete Aggregate
class ConcreteAggregate
    include Enumerable
    attr_reader :data

    def initialize
        @data = []
    end

    def add_data(val)
        @data.push(val)
    end

    def each(&block)
        iterator = ConcreteIterator.new(self)
        while iterator.has_next?
            block.call(iterator.next)
        end
    end
end

# Client code
aggregate = ConcreteAggregate.new
(0..9).each { |i| aggregate.add_data(i) }
aggregate.each { |val| print "#{val} " }

=begin 
0 1 2 3 4 5 6 7 8 9 
=end