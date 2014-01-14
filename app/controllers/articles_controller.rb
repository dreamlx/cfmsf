class ArticlesController < ApplicationController
  def index
  	articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
    if @article.status != "public"
      redirect_to root_path, alert: "this article isn't exist" 
    end
  end

  def search
  	search = params[:search] unless params[:search].blank?
  	@articles = Article.search_by_title(search)
  end
end