class Food < ActiveRecord::Base
  belongs_to :food_category
  has_many :food_users
  
end
