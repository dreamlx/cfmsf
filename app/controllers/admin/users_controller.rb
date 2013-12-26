module Admin

  class UsersController < Admin::BaseController
    def index
      @users = User.order("id desc")
    end

    def show
      @user = User.find(params[:id])
    end
    def edit
      @user = User.find(params[:id])
      @categories = Category.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successful deleted'
    end

    def create
      @user = User.new(params[:user])
      if @user.role == "editor"
        category_ids = params[:category_ids]
        category_ids.each do |category_id|
          category = Category.find(category_id)
          @user.categories << category
        end
      end
          
      if @user.save
        redirect_to admin_users_path, notice: 'User was successful created'
      else
        render action: "new", notice: 'User was failed created'
      end
    end

    def update
      @user = User.find(params[:id])
      origin_categories = @user.categories.delete_all
      category_ids = params[:category_ids]
      category_ids.each do |category_id|
        category = Category.find(category_id)
        @user.categories << category
      end
      if @user.update_attributes(params[:user])
        redirect_to admin_users_path, notice: 'User was successful updated'
      else
        @user.categories << origin_categories
        @categories = Category.all
        render action: "edit"
      end
    end

    def new 
      @user = User.new
      @categories = Category.all
    end
  end
end