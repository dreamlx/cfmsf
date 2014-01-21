module Admin
  class CategoriesController < Admin::BaseController
    load_and_authorize_resource
    
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
    end

    def new
      @category = Category.new
    end

    def edit
      @category = Category.find(params[:id])
    end

    def create
      @category = Category.new(params[:category])
      if @category.save
        redirect_to admin_categories_path, notice: 'category_success_created'
      else
        render action: "new", alert: 'category_failed_created'
      end
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to admin_categories_path, notice: 'category_success_updated'
      else
        render action: "edit", alert: 'category_failed_updated'
      end
    end

    def destroy
      @category = Category.find(params[:id])
      if @category.destroy
        redirect_to admin_categories_path, notice: 'category_success_deleted'
      else
        render action: "index", alert: "category_failed_deleted"
      end
    end
  end
end