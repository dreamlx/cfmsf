class ProjectsController < ApplicationController

	def index
		@projects = Project.page(params[:page])
	  	@tags = Project.tag_counts_on(:tags)
	end

	def show
		@project = Project.find(params[:id])
		@works = @project.works
	end
end
