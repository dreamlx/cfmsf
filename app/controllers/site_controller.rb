class SiteController < ApplicationController

  def aboutus
    @css = "site_aboutus"
  end

  def services
    @css = "site_services"
  end

  def contact
    @css = "site_contact"
  end

  def security
    @css = "site_security"
  end

  def faq
    @leave_message = LeaveMessage.new
    @errors = Array.new
    @messages = params[:messages]
    if !@messages.nil?
      @messages.each do |msg|
        msg[1].each do |error|
          @errors.push(error)
        end
      end
    end
  end

  def careers
  end
end
