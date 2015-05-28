# == Schema Information
#
# Table name: purchases
#
#  id            :integer          not null, primary key
#  purchase_date :date
#  food_id       :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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

 def self.view_by_zip
 	User.all.group_by(&:zip).map{ |zip, users| {zip => users.map(&:purchases).flatten.sort } }
 end
 

end
