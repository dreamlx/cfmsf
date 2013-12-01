class ProjectsController < ApplicationController

	def index
		if params[:search].blank?
		    @projects = Project.page(params[:page]).order("top desc", "id desc")
		else
			search_by_tag(params[:search])
		end
		@slides = Slide.order("id desc")
		if @projects.length < 1
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

	private

		def search_by_tag(search)
			@tags = Project.tag_counts_on(:tags).where("name like '%#{search}%'")
			@projects = Project.tagged_with(@tags).page(params[:page]).order("top desc", "id desc")	
			@css = "projects_index"
		end

	# def tags
	# 	tag = Project.tag_counts_on(:tags).find(params[:id])
	# 	@projects = Project.tagged_with(tag)
	# end
end
