class ProjectsController < ApplicationController

	def index
		@projects = Project.page(params[:page]).order("top desc")

		if @projects.length < 1
			render nothing: true
			redirect_to "2.html" #redirect to a error page make js stop loading
		else
			@tags = Project.tag_counts_on(:tags)
		  	@css = "projects_index"
		end

	  	
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
