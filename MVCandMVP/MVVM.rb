# Model class
class Model
    attr_accessor :data

    def set_data(data)
        puts "Model: Set data."
        self.data = data
    end

    def get_data
        puts "Model: Get data."
        data
    end
end

# ViewModel class
class ViewModel
    attr_reader :model, :data

    def initialize(model)
        @model = model
        update_data
    end

    def update_model(data)
        puts "ViewModel: Update data."
        model.set_data(data)
        update_data
    end

    def update_data
        puts "ViewModel: Fetch data."
        @data = model.get_data
    end
end

# View class
class View
    attr_reader :view_model

    def initialize(view_model)
        @view_model = view_model
    end

    def display_data
        puts "Display Data: #{view_model.data}"
    end

    def get_user_input
        print "View: Enter user input: "
        userInput = "hello, world!"
        puts userInput
        #userInput = gets.chomp
        view_model.update_model(userInput)
    end
end

# Client code
puts "Client: Pass trigger to ViewModel."
model = Model.new
view_model = ViewModel.new(model)
view = View.new(view_model)

# Display initial data
view.display_data

# Get user input and update data
view.get_user_input

# Display updated data
view.display_data

=begin 
Client: Pass trigger to ViewModel.
ViewModel: Fetch data.
Model: Get data.
Display Data: 
View: Enter user input: hello, world!
ViewModel: Update data.
Model: Set data.
ViewModel: Fetch data.
Model: Get data.
Display Data: hello, world! 
=end