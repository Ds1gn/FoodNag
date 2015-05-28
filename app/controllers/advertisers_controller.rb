class AdvertisersController < ApplicationController
  def dashboard
  	@zips = Whatever.all
  end

  def zip
  	@zipcode = params[:zip]
  	@purchases = Purchase.zip(@zipcode)
  end

end
