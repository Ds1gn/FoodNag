class Purchase < ActiveRecord::Base
  belongs_to :food
  belongs_to :user
  has_one :expiration

  after_create :set_expiration


 def food_user
 	FoodUser.find_by(food_id: food_id, user_id: user_id)
 end

 def set_expiration
 	Expiration.create(food_id: food.id, purchase_id: self.id)
 end


 

end
