class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  before_filter :authenticate_user!
  layout "application"

  protect_from_forgery
end