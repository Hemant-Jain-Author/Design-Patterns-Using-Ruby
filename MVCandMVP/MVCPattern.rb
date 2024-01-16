# Model class
class Model
    attr_accessor :data

    def initialize
        @data = 'Hello, World!'
    end

    def set_data(data)
        puts "Model: Set data : #{data}"
        @data = data
    end

    def get_data
        puts "Model: Get data: #{@data}"
        @data
    end
end

# View class
class View
    def initialize(model)
        @model = model
    end

    # In classic MVC, the view interacts with the model to get data.
    def update
        data = @model.get_data
        puts "View: Updating the view with data : #{data}"
    end
end

# Controller class
class Controller
    def initialize
        @model = Model.new
        @view = View.new(@model)
    end

    def set_data(data)
        puts 'Controller: Receive data from client.'
        @model.set_data(data)
    end

    def update_view
        puts 'Controller: Receive update view from client.'
        @view.update
    end
end

# Client code
controller = Controller.new
controller.update_view

controller.set_data('Hello, Students!')
controller.update_view

=begin 
Controller: Receive update view from client.
Model: Get data: Hello, World!
View: Updating the view with data : Hello, World!
Controller: Receive data from client.
Model: Set data : Hello, Students!
Controller: Receive update view from client.
Model: Get data: Hello, Students!
View: Updating the view with data : Hello, Students! 
=end