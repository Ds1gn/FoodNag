class AdvertisersController < ApplicationController
  def dashboard
    render layout: false
  end

  def zip

  	@zipcode = params[:zip]
  	@purchases_by_zip = Purchase.with_deleted.zip(@zipcode)
	render layout: false
  end

end
