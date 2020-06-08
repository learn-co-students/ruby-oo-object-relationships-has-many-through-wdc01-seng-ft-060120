class Customer
  attr_reader :name, :age
  attr_writer :meals
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @meals = []
    @waiters = []
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    @waiters << waiter
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    @meals = Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    @waiters
  end

end
