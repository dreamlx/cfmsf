#coding: utf-8
class HomeController < ApplicationController
  def index
  	@news_category = Category.find_by_french_name('nouvelles')
  end
end