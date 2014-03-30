class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  layout "application"

  protect_from_forgery
  before_filter :get_all_category, :set_locale

  private

  def get_all_category
    @categories = Category.where(published: true)
  	@chinese_categories = Array.new
    @chinese_categories.push(Category.find(1))
    @chinese_categories.push(Category.find(2))
    @chinese_categories.push(Category.find(6))
    @chinese_categories.push(Category.find(3))
    @chinese_categories.push(Category.find(4))
    @chinese_categories.push(Category.find(5))

    @french_categories = Array.new
    @french_categories.push(Category.find(1))
    @french_categories.push(Category.find(2))
    @french_categories.push(Category.find(3))
    @french_categories.push(Category.find(4))
    @french_categories.push(Category.find(5))
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

