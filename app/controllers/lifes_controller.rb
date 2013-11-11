class LifesController < ApplicationController
  def index
   @lifes = Life.page(params[:page]).order("id desc")
   @css = 'lifes'
  end

  def show
    @css = 'lifes'
    @life = Life.find(params[:id])
    @tags = Life.tag_counts_on(:tags)
    @comments = @life.comments
    @comment = @life.comments.build
  end
    
  def edit
    @life = Life.find(params[:id])
  end

  def destroy
    @life = Life.find(params[:id])
    @life.destroy
    redirect_to admin_lifes_path, notice: 'life was successful deleted'
  end

  def create
    @life = Life.new(params[:life])
    @life.author = current_user.email
    if @life.save
      redirect_to admin_lifes_path, notice: 'life was successful created'
    else
      render action: "new"
    end
  end

  def update
    @life = Life.find(params[:id])
    if @life.update_attributes(params[:life])
      redirect_to admin_lifes_path, notice: 'life was successful updated'
    else
      render action: "edit"
    end
  end

  def new
    @life = Life.new 
  end
end
