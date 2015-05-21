class Expiration < ActiveRecord::Base
  belongs_to :food
  belongs_to :purchase

#this method will notify user when their food is about to expire
#the default is 1 day before shelf life is reached, which is why: -1.day
  def notification_date
  	purchase.created_at + (food.shelf_life - 1).days 
  end

  def expiration_date
  	purchase.created_at + (food.shelf_life).days 
  end

end
