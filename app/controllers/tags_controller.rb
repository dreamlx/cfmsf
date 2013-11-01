class TagsController < ApplicationController
	def projects
		@tags = Project.tag_counts_on(:tags)
		tag = @tags.find(params[:id])
		@projects = Project.tagged_with(tag)
		@css = "projects_index"
	end
end