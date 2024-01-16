class Student
    attr_accessor :name, :id

    def initialize(name, id)
        @name = name
        @id = id
    end
end

class Model
    attr_reader :student

    def initialize
        @student = Student.new('Harry', 1)
    end

    def set_data(name, id)
        puts "Model: Set data : #{name} #{id}"
        @student.name = name
        @student.id = id
    end

    def get_data
        puts 'Model: Get data.'
        @student
    end
end

class View
    def initialize(model)
        @model = model
    end

    def update
        student = @model.get_data
        puts "View: Student Info, Name: #{student.name} Id: #{student.id}"
    end
end

class Controller
    def initialize
        @model = Model.new
        @view = View.new(@model)
    end

    def set_data(name, id)
        puts 'Controller: Receive data from client.'
        @model.set_data(name, id)
    end

    def update_view
        puts 'Controller: Receive update view from client.'
        @view.update
    end
end

# Client code
controller = Controller.new
controller.update_view

controller.set_data('Jack', 2)
controller.update_view


=begin 
Controller: Receive update view from client.
Model: Get data.
View: Student Info, Name: Harry Id: 1
Controller: Receive data from client.
Model: Set data : Jack 2
Controller: Receive update view from client.
Model: Get data.
View: Student Info, Name: Jack Id: 2
=end