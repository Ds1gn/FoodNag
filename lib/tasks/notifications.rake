namespace :notifications do
  desc "Send notifications to user"
  task expiration: :environment do
  	Expiration.find_each do |e|
  		if e.notification_date.today?
  			ExpirationNotificationMailer.send_email(e.purchase.user.id, e.id, e.food.id, e.purchase.id).deliver_now
  		end
  	end
  end

end
