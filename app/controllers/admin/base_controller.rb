module Admin
  
  class BaseController < ApplicationController
    # before_filter :authenticate_user!
    layout 'admin'
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to admin_home_index_path, :alert => exception.message
    end
  end
end