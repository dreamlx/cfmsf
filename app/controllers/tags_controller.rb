class TagsController < ApplicationController
	def projects
		@tags = Project.tag_counts_on(:tags)
		tag = @tags.find(params[:id])
		@projects = Project.tagged_with(tag).page(params[:page])
		@css = "projects_index"
	end

  def lifes
    @tags = Life.tag_counts_on(:tags)
    tag = @tags.find(params[:id])
    @lifes = Life.tagged_with(tag).page(params[:page])
    @css = 'life_index'
  end


	def auto_complete_tag
    @tags = Project.tag_counts
    t = Array.new
    @tags.each do |tag|
      t.push(tag.name)
    end
    respond_to do |format|
      format.json {render json: t}
    end
  end

  def index
    @tags = Project.tag_counts_on(:tags)
    render :json => @tags
  end
end