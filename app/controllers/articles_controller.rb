class ArticlesController < ApplicationController
  def index
  	articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def search
  	search = params[:search] unless params[:search].blank?
  	@articles = Article.search_by_title(search)
  end
end