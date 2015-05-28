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
  acts_as_paranoid

  belongs_to :food
  belongs_to :user
  has_one :expiration

  after_create :set_expiration

  scope :meats, -> { joins(:food).where(foods: {food_category_id: 3})}
  scope :vegetable, -> { joins(:food).where(foods: {food_category_id: 2})}
  scope :fruits, -> { joins(:food).where(foods: {food_category_id: 1})}



 def food_user
 	FoodUser.find_by(food_id: food_id, user_id: user_id)
 end

 def set_expiration
 	Expiration.create(food_id: food.id, purchase_id: self.id)
 end

<<<<<<< HEAD
 # def all_purchases
 # 	Purchase.with_delete(food_id: food.id, purchase_id: self.id, user_id: user_id)
 # end

=======

 def self.view_by_zip
 	User.all.group_by(&:zip).map{ |zip, users| {zip => users.map(&:purchases).flatten.sort } }
 end
 
>>>>>>> e78f43e241f3f785ea3ea87e4c762b73b5a4679f
# def get_food_name
# 	Purchase.all.each do |n|
# 		n.name food_id
# 	end
# end


end
