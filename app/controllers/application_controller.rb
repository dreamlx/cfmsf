class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  layout "application"

  protect_from_forgery
  before_filter :get_all_category

  private

  def get_all_category
  	@categories = Category.all
  end
end

