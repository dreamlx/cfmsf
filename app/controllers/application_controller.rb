class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  protect_from_forgery

  def recommendProjects
  	@tags = Project.tag_counts_on(:tags)
  	@recommendProjects =  Project.random_top(4)
  end
end