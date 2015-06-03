class AdvertisersController < ApplicationController
  def dashboard
    render layout: false
  end

  def zip
    @user = User.all
    @all_purchases = Purchase.with_deleted
    @number_of_purchases = @all_purchases.size
  	@zipcode = params[:zip]
  	@purchases_by_zip = Purchase.with_deleted.zip(@zipcode)
	render layout: false
  end

end
