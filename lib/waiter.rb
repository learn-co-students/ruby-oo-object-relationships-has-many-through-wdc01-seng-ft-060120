class Waiter
    attr_accessor :name, :experience

    @@all = []
    def initialize(name, experience)
        @name  = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        biggest_tip = 0
        biggest_tipper = ""
        Meal.all.each do |meal|
            if meal.tip > biggest_tip
                biggest_tip = meal.tip
                biggest_tipper = meal.customer                
            end
        end
        biggest_tipper
    end

end