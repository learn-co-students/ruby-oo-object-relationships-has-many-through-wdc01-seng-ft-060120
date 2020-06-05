class Waiter
    attr_accessor :name, :yrs_exp
    @@all = []

    def initialize(name, yr)
        @name = name
        @yrs_exp = yr 
        @@all << self
    end 

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals
        Meal.all.select{|meal|meal.waiter==self}
    end 

    def best_tipper
        meals.max_by{|meal|meal.tip}.customer
    end 
        


end