class LifesController < ApplicationController
  def index
    if !params[:month].blank?
      @lifes = Life.find_by_month(params[:month].to_i).page(params[:page]).order("id desc")
    elsif !params[:tag_id].blank?
      @tags = Life.tag_counts_on(:tags)
      tag = @tags.find(params[:tag_id])
      @lifes = Life.tagged_with(tag).page(params[:page])
    else
      @lifes = Life.page(params[:page]).order("id desc")
    end
    @tags = Life.tag_counts_on(:tags)
    @css = 'life_index'
  end

  def show
    @css = 'life_show'
    @lifes = Life.all
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
