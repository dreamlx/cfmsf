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
  end

  def careers
  end
end
