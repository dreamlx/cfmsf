class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	if @category.articles.where(status: "public").size == 1 
      article = @category.articles.where(status: "public").first
  	  redirect_to article_path(article)
    end
  end
end
