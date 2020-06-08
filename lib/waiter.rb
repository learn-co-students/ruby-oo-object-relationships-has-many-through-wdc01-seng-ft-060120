require 'pry'
class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(customer,total,tip=0)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select{|meal|meal.waiter==self}
    end
    
    def best_tipper
        max_tip = 0
        max_tip_from = nil

        self.meals.each do |meal|
            if meal.tip >= max_tip
                max_tip = meal.tip
                max_tip_from = meal.customer
            end
        end
        return max_tip_from
    end
    #returns array of the most frequent customers
    #if only one customer is the most frequent, returns the customer
    def most_frequent_customer()
        customer_map = Hash.new(0)
        
        #add each customer as a key, and their count as value
        meals.each do |meal| 
            if customer_map[meal.customer] != nil
                customer_map[meal.customer] += 1
            else
                customer_map[meal.customer] = 1
            end   
        end     
       
        #amount of visits by customer
        cust_count = 0
        #most frequent (or the last of all most frequents)
        best_cust = nil
        #set new most visiting customer
        customer_map.each do |(key,value)|
            if value >= cust_count
                cust_count = value
                best_cust = key                
            end            
        end
        #add all customers that match,
        #more than one customer may have visited the same amount of times
        best_customers = []
        customer_map.each do |(key,value)|
            if value == cust_count
                best_customers << key
            end
        end
        #return single customer  or return the array
        return best_customers if best_customers.length > 1
        return best_customers[0]
    end
   
end