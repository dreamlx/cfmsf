class SiteController < ApplicationController
  def projects
  	@projects = Project.page(params[:page])
  	@tags = Project.tag_counts_on(:tags)
  end

  def project
    project = Project.find(params[:id])
    @works = project.works.page(params[:page])
  end

  def aboutus
  end

  def services
  end

  def contact
  end

  def security
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
