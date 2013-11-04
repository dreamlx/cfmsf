class LeaveMessagesController < ApplicationController
  def index
  end

  def new
    @leave_message = LeaveMessage.new
    @css = "leave_messages_new"
    # @messages = params[:messages]
    # if !@messages.nil?
    #   @messages.each do |msg|
    #     msg[1].each do |error|
    #       @errors.push(error)
    #     end
    #   end
    # end
  end

  def create
    if valid_captcha?(params[:captcha])
      @leave_message = LeaveMessage.new(params[:leave_message])
      if @leave_message.save
        redirect_to new_leave_message_path(:messages => @leave_message.errors.messages)
      else
        render action: "/leave_messages/new"
      end
    else
      redirect_to "/leave_messages/new", :alert => "The captcha is not match"
    end

  end
end
