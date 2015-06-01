class AdvertisersController < ApplicationController
  def dashboard

  end

  def zip
  	@zipcode = params[:zip]
  	@purchases_by_zip = Purchase.with_deleted.zip(@zipcode)

  end

end
