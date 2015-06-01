class StaticPageController < ApplicationController
  def home
    render layout: false
  end
end
