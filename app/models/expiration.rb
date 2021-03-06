# == Schema Information
#
# Table name: expirations
#
#  id          :integer          not null, primary key
#  food_id     :integer
#  user_id     :integer
#  expires_at  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purchase_id :integer
#

class Expiration < ActiveRecord::Base
  belongs_to :food
  belongs_to :purchase

#this method will notify user when their food is about to expire
#the default is 1 day before shelf life is reached, which is why: -1 day in notification_date method
  def notification_date
  	
  	purchase.created_at + (food.shelf_life - 1).days

  end

  def expiration_date
  	purchase.created_at + (food.shelf_life).days 
  end

end
