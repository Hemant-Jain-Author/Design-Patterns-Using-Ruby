# Student class
class Student
    attr_reader :name, :id

    def initialize(name, id)
        @name = name
        @id = id
    end
end

# Model class
class Model
    attr_reader :student

    def initialize
        @student = Student.new("Harry", 1)
    end

    def set_data(name, id)
        puts "Model: Set data: #{name} #{id}"
        @student = Student.new(name, id)
    end

    def get_data
        puts "Model: Get data."
        @student
    end
end

# View class
class View
    def update(name, id)
        puts "View: Student Info: #{name} #{id}"
    end
end

# Presenter class
class Presenter
    def initialize
        @model = Model.new
        @view = View.new
    end

    def set_data(name, id)
        puts "Presenter: Receive data from client."
        @model.set_data(name, id)
    end

    def update_view
        puts "Presenter: Receive update from client."
        data = @model.get_data
        @view.update(data.name, data.id)
    end
end

# Client code
puts "Client: Pass trigger to Presenter."
presenter = Presenter.new
presenter.update_view

presenter.set_data("Jack", 2)
presenter.update_view

=begin 
Client: Pass trigger to Presenter.
Presenter: Receive update from client.
Model: Get data.
View: Student Info: Harry 1
Presenter: Receive data from client.
Model: Set data: Jack 2
Presenter: Receive update from client.
Model: Get data.
View: Student Info: Jack 2
=end