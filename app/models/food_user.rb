# == Schema Information
#
# Table name: food_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  food_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  custom_reminder :integer
#

class FoodUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :food
end
