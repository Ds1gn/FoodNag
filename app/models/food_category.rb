# == Schema Information
#
# Table name: food_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodCategory < ActiveRecord::Base
  has_many :foods
end
