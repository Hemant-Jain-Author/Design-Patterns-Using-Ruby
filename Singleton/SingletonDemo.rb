class Database
  def initialize
    puts 'Database created'
  end

  def add_data(data)
    puts data
  end
end

class Singleton
  @@instance = nil

  private_class_method :new

  def self.get_instance
    @@instance ||= new
  end

  def initialize
    @db = Database.new
  end

  def add_data(data)
    @db.add_data(data)
  end
end

# Client code
s1 = Singleton.get_instance
s2 = Singleton.get_instance

puts s1
puts s2

s2.add_data('Hello, world!')
