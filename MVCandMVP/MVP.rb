# Model class
class Model
    attr_accessor :data
    attr_writer :presenter

    def initialize
        @data = nil
    end

    def set_data(data)
        puts 'Model: Set data.'
        @data = data
        @presenter.model_update_event
    end

    def get_data
        puts 'Model: Get data.'
        @data
    end
end

# Presenter class
class Presenter
    attr_reader :model, :view

    def initialize(model, view)
        @model = model
        @view = view
    end

    def handle_user_input(user_input)
        puts 'Presenter: Handle user input.'
        model.set_data(user_input)
    end

    def model_update_event
        puts 'Presenter: Model update event.'
        view.update(model.get_data)
    end
end

# View class
class View
    attr_writer :presenter

    def update(data)
        puts 'View: Update UI.'
        puts "Data: #{data}"
    end

    def get_user_input
        print 'View: Enter user input: '
        # user_input = gets.chomp
        user_input = 'hello, world!'
        puts user_input
        @presenter.handle_user_input(user_input)
    end
end

# Client code
model = Model.new
view = View.new
presenter = Presenter.new(model, view)

model.presenter = presenter
view.presenter = presenter

view.get_user_input

=begin 
View: Enter user input: hello, world!
Presenter: Handle user input.
Model: Set data.
Presenter: Model update event.
Model: Get data.
View: Update UI.
Data: hello, world!
=end