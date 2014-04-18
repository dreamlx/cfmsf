#coding: utf-8
class HomeController < ApplicationController
  def index
  	@news_category = Category.find_by_french_name('nouvelles')
    @study_domain = Article.find_by_chinese_title('学习园地')
    @contact_us = Article.find_by_chinese_title('联系我们')
  end
end