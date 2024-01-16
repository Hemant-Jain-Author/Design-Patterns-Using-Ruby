# Model class
class Model
    attr_accessor :data

    def initialize
        @data = "Hello, World!"
    end

    def set_data(data)
        puts "Model: Set data: #{data}"
        @data = data
    end

    def get_data
        puts "Model: Get data: #{@data}"
        @data
    end
end

# View class
class View
    def update(data)
        puts "View: Updating the view with data: #{data}"
    end
end

# Presenter class
class Presenter
        def initialize
        @model = Model.new
        @view = View.new
    end

    def set_data(data)
        puts "Presenter: Receive data from client."
        @model.set_data(data)
    end

    def update_view
        puts "Presenter: Receive update view from client."
        data = @model.get_data
        @view.update(data)
    end
end

# Client code
puts "Client: Pass trigger to Presenter."
presenter = Presenter.new
presenter.update_view

presenter.set_data("Hello, Students!")
presenter.update_view
  
=begin 
Client: Pass trigger to Presenter.
Presenter: Receive update view from client.
Model: Get data: Hello, World!
View: Updating the view with data: Hello, World!
Presenter: Receive data from client.
Model: Set data: Hello, Students!
Presenter: Receive update view from client.
Model: Get data: Hello, Students!
View: Updating the view with data: Hello, Students! 
=end
