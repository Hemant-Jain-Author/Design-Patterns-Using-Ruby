class Mediator
    def add_colleague(colleague)
    end

    def send_message(message, colleague_id)
    end
end 
    
class ConcreteMediator < Mediator
    def initialize
      @colleagues = {}
    end
    
    def add_colleague(colleague)
      @colleagues[colleague.id] = colleague
    end
  
    def send_message(message, colleague_id)
      puts "Mediator pass Message : #{message}"
      @colleagues[colleague_id].receive(message)
    end
  end
  
  class Colleague
    attr_reader :mediator, :id
  
    def initialize(mediator, id)
      @mediator = mediator
      @id = id
    end
  
    def send(message, to)
      puts "#{id} Sent Message : #{message}"
      mediator.send_message(message, to)
    end
  
    def receive(message)
      puts "#{id} Received Message #{message}"
    end
  end
  
  class ConcreteColleague1 < Colleague
    def initialize(mediator)
      super(mediator, "First")
    end
  end
  
  class ConcreteColleague2 < Colleague
    def initialize(mediator)
      super(mediator, "Second")
    end
  end
  
  # Client code
  mediator = Mediator.new
  first = ConcreteColleague1.new(mediator)
  mediator.add_colleague(first)
  second = ConcreteColleague2.new(mediator)
  mediator.add_colleague(second)
  
  first.send("Hello, World!", "Second")

=begin 
First Sent Message : Hello, World!
 =end