class ProjectsController < ApplicationController

	def index
		@projects = Project.page(params[:page]).order("top desc")
	  	@tags = Project.tag_counts_on(:tags)
	end

	def show
		@project = Project.find(params[:id])
		@works = @project.works
	end

	def tag
		tag = Project.tag_counts_on(:tags).find(params[:id])
		@projects = Project.tagged_with(tag)
	end
end
