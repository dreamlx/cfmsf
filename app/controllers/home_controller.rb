class HomeController < ApplicationController
  def index
  	@news_category = Category.find(7)
  end
end