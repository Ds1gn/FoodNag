class ExpirationNotificationMailer < ApplicationMailer
	def send_email(user_id, expiration_id, food_id, purchase_id)
	    @user = User.find(user_id)
	    @expiration = Expiration.find(expiration_id)
	    @food = Food.find(food_id)
	    @purchase = Purchase.find(purchase_id)
	    
	    mail(to: @user.email, subject: 'Food Expiration Reminder')
  	end

end
