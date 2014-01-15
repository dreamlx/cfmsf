module Admin

  class UsersController < Admin::BaseController
    load_and_authorize_resource
    
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
      redirect_to admin_users_path, notice: 'user_success_deleted'
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        if @user.role == "editor"
          category_ids = params[:category_ids]
          if !category_ids.nil?
            category_ids.each do |category_id|
              category = Category.find(category_id)
              @user.categories << category
            end
          end
          redirect_to admin_users_path, notice: 'user_success_created'
        else @user.role == "admin"
          redirect_to admin_users_path, notice: 'user_success_created'
        end
      else
        @categories = Category.all
        render action: "new", notice: 'user_failed_created'
      end
    end

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
        params[:user].delete(:current_password)
      end

      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        @user.categories.delete_all
        if @user.role == "editor"
          category_ids = params[:category_ids]
          if !category_ids.nil?
            category_ids.each do |category_id|
              category = Category.find(category_id)
              @user.categories << category
            end
          end
        else @user.role == "admin"
          categories = Category.all
          @user.categories << categories
        end
        redirect_to admin_users_path, notice: 'user_success_updated'
      else
        @categories = Category.all
        render action: "edit", alert: "user_failed_updated"
      end
    end

    def new 
      @user = User.new
      @categories = Category.all
    end
  end
end