module Admin
  class LeaveMessagesController <  Admin::BaseController
    def index
      @leave_messages = LeaveMessage.order("id desc")
    end

    def destroy
      @leave_message = LeaveMessage.find(params[:id])
      @leave_message.destroy
      format.html { redirect_to admin_leave_messages_url }
    end
  end
end