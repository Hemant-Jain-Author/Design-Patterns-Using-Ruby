class ImmutablePerson
    attr_reader :name, :age, :gender
  
    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end
end
  
# Client code
person = ImmutablePerson.new("John Doe", 30, "Male")
new_person = ImmutablePerson.new("John Doe", 31, "Male")

puts person.inspect
puts new_person.inspect
# Attempting to modify an immutable object in Ruby won't result in a compilation error,
# but it's generally understood that you don't modify such objects.
new_person.age = 32  # This line would raise a NoMethodError

  