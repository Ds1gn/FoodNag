class Purchase < ActiveRecord::Base
  belongs_to :food
  belongs_to :user


 def food_user
 	FoodUser.find_by(food_id: food_id, user_id: user_id)
 end

 
end
