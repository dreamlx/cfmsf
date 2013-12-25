module Admin
  class CategorysController < Admin::BaseController
    def index
      @categorys = Category.all
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
        redirect_to admin_categorys_path, notice: 'category was successful created'
      else
        render action: "new", alert: 'category was failed created'
      end
    end

    def update
      @category = Category.find(params[:id])
      if @categorysave
        redirect_to admin_categorys_path, notice: 'category was successful updated'
      else
        render action: "edit", alert: 'category was failed updated'
      end
    end

    def destroy
      @category = Category.find(params[:id])
      if @category.destroy
        redirect_to admin_categorys_path, notice: 'category was successful deleted'
      else
        render action: "index", alert: "category was failed deleted"
      end
    end
  end
end