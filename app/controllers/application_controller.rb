class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  layout "application"

  protect_from_forgery
  before_filter :get_all_category, :set_locale

  private

  def get_all_category
    @categories = Category.where(published: true).where("parent_id is null or parent_id = ''").order(:order_no)
  end

  def set_locale
  # 可以將 ["fr", "zh-CH"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    else
      session[:locale] ||= "zh-CN"
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end
end

