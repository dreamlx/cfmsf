class SiteController < ApplicationController
  def projects
  	@projects = Project.page(params[:page])
  	@tags = Project.tag_counts_on(:tags)
  end

  def project
    
  end

  def aboutus
  end

  def services
  end

  def contact
  end

  def security
  end

  

  def work
  end
end
