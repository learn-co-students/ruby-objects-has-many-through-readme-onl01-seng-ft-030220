class Waiter
  
  attr_accessor :name, :experience, :customer
  
  @@all=[]
  
  def initialize(name,years_of_experience)
    @name=name
    @experience=years_of_experience
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  
  def new_meal(customer,total,tip)
    Meal.new(self,customer,total,tip)
  end 
  
  def meals
    Meal.all.select do |meal|
      meal.waiter==self 
    end 
  end 
  
  def best_tipper
    best_tipped_meal=meals.max do |meal_a,meal_b|
      meal_a.tip<=>meal_b.tip
    end 
    best_tipped_meal.customer
  end 
    

end