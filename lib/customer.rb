require 'pry'

class Customer
    attr_accessor :name, :age

    @@all = []
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters
        # binding.pry
        arr = []
        Meal.all.each do |meal|
            if meal.customer == self
                arr << meal.waiter
            end
        end
        # binding.pry
        arr
    end

end