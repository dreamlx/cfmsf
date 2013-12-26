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
      category_ids = params[:category_ids] if (@user.role == "editor" and !params[:category_ids].blank?)
      if @user.save
        category_ids.each do |category_id|
          category = Category.find(category_id)
          @user.categories << category
        end
        redirect_to admin_users_path, notice: 'User was successful created'
      else
        @categories = Category.all
        render action: "new", notice: 'User was failed created'
      end
    end

    def update
      @user = User.find(params[:id]) 
      category_ids = params[:category_ids] if (@user.role == "editor" and !params[:category_ids].blank?)
      if @user.update_attributes(params[:user])
        category_ids.each do |category_id|
          category = Category.find(category_id)
          @user.categories << category
        end
        redirect_to admin_users_path, notice: 'User was successful updated'
      else
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