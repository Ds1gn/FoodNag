namespace :notifications do
	desc "Send notifications to user"
	task expiration: :environment do
		Expiration.find_each do |e|
			begin
				if e.notification_date.today?
					ExpirationNotificationMailer.send_email(
						e.purchase.user.id,
						e.id,
						e.food.id,
						e.purchase.id).deliver_now
				end
			rescue => ex
				Rails.logger.info e.inspect
				Rails.logger.info e.food.inspect
				Rails.logger.info ex.inspect
				Rails.logger.info ex.backtrace.join "\n"

			end
		end

	end
end