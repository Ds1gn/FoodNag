# == Schema Information
#
# Table name: foods
#
#  id               :integer          not null, primary key
#  name             :string
#  image            :string
#  shelf_life       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  food_category_id :integer
#

class Food < ActiveRecord::Base
  belongs_to :food_category
  has_many :food_users
  
end
