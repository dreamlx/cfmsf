module Admin

  class CommentsController < Admin::BaseController
    before_filter :find_life

    def index
      @comments = @life.comments.page(params[:page]).order("id desc")
    end

    def show
      @comment = @life.comments.find(params[:id])
    end

    def destroy
      @comment = @life.comments.find(params[:id])
      @comment.destroy
      redirect_to admin_life_comments_url(@life), notice: 'comment was successful deleted'
    end

    def create
      @comment = @life.comments.build(params[:comment])
      if @comment.save
    	  redirect_to admin_life_comments_url(@life), notice: 'comment was successful created'
      else
    	render action: "new"
      end
    end


    def new
      @comment = @life.comments.build
    end

    def find_life
      @life = Life.find(params[:life_id])
    end
  end
end