module Admin
  class LeaveMessagesController <  Admin::BaseController
  # GET /admin/leave_messages
  # GET /admin/leave_messages.json
    def index
      @leave_messages = LeaveMessage.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @leave_messages }
      end
    end

    # DELETE /admin/leave_messages/1
    # DELETE /admin/leave_messages/1.json
    def destroy
      @leave_message = LeaveMessage.find(params[:id])
      @leave_message.destroy

      respond_to do |format|
        format.html { redirect_to admin_leave_messages_url }
        format.json { head :no_content }
      end
    end
  end
end