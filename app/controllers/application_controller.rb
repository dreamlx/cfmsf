class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  layout "application"

  protect_from_forgery
end