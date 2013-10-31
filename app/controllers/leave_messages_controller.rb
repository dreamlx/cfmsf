class LeaveMessagesController < ApplicationController
  def index
  end

  def new
    @leave_message = LeaveMessage.new
  end

  def create
    if valid_captcha?(params[:captcha])
      @leave_message = LeaveMessage.new(params[:leave_message])
      if @leave_message.save
        redirect_to site_faq_path(:messages => @leave_message.errors.messages)
      else
        redirect_to site_faq_path(:messages => @leave_message.errors.messages)
      end
    else
      redirect_to site_faq_path, :alert => "The captcha is not match"
    end

  end
end
