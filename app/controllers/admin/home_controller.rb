module Admin
  
  class HomeController < Admin::BaseController
    def index
      @current_category = Category.find(params[:category_id]) unless params[:category_id].blank?
      if @current_category.blank?
        @current_category = current_user.categories.first
      end
      @articles = Array.new
      @articles = @current_category.articles.limit(25) unless @current_category.blank?
    end
  end
end