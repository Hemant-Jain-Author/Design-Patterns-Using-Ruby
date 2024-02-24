# Memento
class Memento
    attr_reader :state

    def initialize(state)
        @state = state
    end
end

# CareTaker
class CareTaker
    attr_reader :history, :top, :max

    def initialize
        @history = []
        @top = -1
        @max = -1
    end

    def add_memento(memento)
        @top += 1
        @max = @top

        if @top <= @history.size - 1
            @history[@top] = memento
        else
            @history << memento
        end
    end

    def get_memento(index)
        @history[index]
    end

    def undo
        puts 'Undoing state.'
        if @top <= 0
            @top = 0
            return get_memento(0)
        end

        @top -= 1
        get_memento(@top)
    end

    def redo
        puts 'Redoing state.'
        if @top >= (@history.size - 1) || @top >= @max
            return get_memento(@top)
        end

        @top += 1
        get_memento(@top)
    end

    def states_count
        @history.size
    end
end

# Originator
class Originator
    attr_accessor :state

    def initialize
        @care_taker = CareTaker.new
    end

    def set_state(state)
        @state = state
        @care_taker.add_memento(create_memento)
    end

    def undo
        set_memento(@care_taker.undo)
    end

    def redo
        set_memento(@care_taker.redo)
    end

    def create_memento
        Memento.new(state)
    end

    def set_memento(memento)
        @state = memento.state
    end
end

# Client code
originator = Originator.new
originator.set_state('State 1')
puts originator.state

originator.set_state('State 2')
puts originator.state

originator.set_state('State 3')
puts originator.state

originator.undo
puts originator.state

originator.undo
puts originator.state

originator.redo
puts originator.state

originator.redo
puts originator.state

=begin 
State 1
State 2
State 3
Undoing state.
State 2
Undoing state.
State 1
Redoing state.
State 2
Redoing state.
State 3
=end