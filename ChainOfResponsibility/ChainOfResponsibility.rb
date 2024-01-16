# Abstract class representing a handler
class Handler
    attr_accessor :successor
  
    def initialize(successor)
        @successor = successor
    end
  
    def handle_request
        raise NotImplementedError, 'Subclasses must implement this method'
    end
end
  
# Class representing a concrete handler 1
class ConcreteHandler1 < Handler
    def initialize(successor)
        super(successor)
    end
  
    def handle_request
        if true # Can handle request.
            puts 'Finally handled by ConcreteHandler1'
        elsif successor
            puts 'Message passed to next in chain by ConcreteHandler1'
            successor.handle_request
        end
    end
end
  
  # Class representing a concrete handler 2
  class ConcreteHandler2 < Handler
    def initialize(successor)
        super(successor)
    end
  
    def handle_request
        if false # Can't handle request.
            puts 'Finally handled by ConcreteHandler2'
        elsif successor
            puts 'Message passed to next in chain by ConcreteHandler2'
            successor.handle_request
        end
    end
end
  
# Client code
ch1 = ConcreteHandler1.new(nil)
ch2 = ConcreteHandler2.new(ch1)
ch2.handle_request

=begin 
Message passed to next in chain by ConcreteHandler2
Finally handled by ConcreteHandler1 
=end
