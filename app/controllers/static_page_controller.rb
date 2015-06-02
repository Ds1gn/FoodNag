class StaticPageController < ApplicationController
if :user == nil
	before_action :logged_in_advertiser?
end

  def home
    render layout: false
  end
end