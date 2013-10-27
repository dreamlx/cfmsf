module Admin

  class ProjectsController < Admin::BaseController
    before_filter :find_project, :except => [:index, :new, :create]

    def index
    	@projects = Project.all
    end

    def show
    end

    def edit
    end

    def destroy
    	@project.destroy
    	redirect_to admin_projects_path, notice: 'project was successful deleted'
    end

    def create
      @project = Project.new(params[:project])
      @project.thumb = crop_image(@project.thumb) unless @project.thumb.nil?
      if @project.save
    	  redirect_to admin_projects_path, notice: 'project was successful created'
    	else
    	  render action: "new"
    	end
    end

    def update
    	if @project.update_attributes(params[:project])
            unless params[:project][:thumb].nil?
              @project.thumb = crop_image(params[:project][:thumb])
              @project.save
            end
    	  redirect_to admin_projects_path, notice: 'project was successful updated'
    	else
    	  render action: "edit"
    	end
    end

    def new
    	@project = Project.new 
    end

    def find_project
        @project = Project.find(params[:id])
    end
  end
end