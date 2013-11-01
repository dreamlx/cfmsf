class ProjectsController < ApplicationController

	def index
		@projects = Project.page(params[:page]).order("top desc")
	  	@tags = Project.tag_counts_on(:tags)
	  	@css = "projects_index"
	end

	def show
		@project = Project.find(params[:id])
		@works = @project.works
	  	@css = "projects_show"
	end

	# def tags
	# 	tag = Project.tag_counts_on(:tags).find(params[:id])
	# 	@projects = Project.tagged_with(tag)
	# end
end
