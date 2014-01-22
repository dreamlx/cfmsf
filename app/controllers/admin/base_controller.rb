module Admin
  
  class BaseController < ApplicationController
    before_filter :authenticate_user!, :set_default_locale
    layout 'admin'
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to admin_home_index_path, :alert => exception.message
    end

    private
      def set_default_locale
      	I18n.locale = "zh-CN"
      end
  end
end