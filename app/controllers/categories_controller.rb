class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	if @category.articles.where(status:"public").size == 1 
  	  redirect_to article_path(@category.articles.first)
    end
  end
end
