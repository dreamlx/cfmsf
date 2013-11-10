class CommentsController < Admin::BaseController
  before_filter :find_life

  def create
    if valid_captcha?(params[:captcha])
      @comment = @life.comments.build(params[:comment])
      if @comment.save
        redirect_to life_url(@life), notice: 'comment was successful created'
      else
       redirect_to life_url(@life, :message => @comment.errors.messages)
      end
    else
      redirect_to life_url(@life), :alert => "The captcha is not match"
    end
  end


  def new
    @comment = @life.comments.build
  end

  def find_life
    @life = Life.find(params[:life_id])
  end
end
