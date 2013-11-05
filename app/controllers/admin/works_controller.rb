module Admin

  class WorksController < Admin::BaseController
    before_filter :find_project

    def index
      @works = @project.works
    end

    def show
      @work = @project.works.find(params[:id])
    end

    def edit
      @work = @project.works.find(params[:id])
    end

    def destroy
      @work = @project.works.find(params[:id])
      @work.destroy
      redirect_to admin_project_works_url(@project), notice: 'work was successful deleted'
    end

    def create
      @work = @project.works.build(params[:work])
      @work.thumb = crop_image(params[:work][:thumb]) unless params[:work][:thumb].nil?
      if @work.save
    	  redirect_to admin_project_works_url(@project), notice: 'work was successful created'
      else
    	render action: "new"
      end
    end

    def update
      @work = @project.works.find(params[:id])
      if @work.update_attributes(params[:work])
        if !params[:work][:thumb].nil?
          @work.thumb = crop_image(params[:work][:thumb])
          @work.save
        end
        redirect_to admin_project_works_url(@project), notice: 'work was successful updated'
      else
        render action: "edit"
      end
    end

    def new
      @work = @project.works.build
    end

    def find_project
      @project = Project.find(params[:project_id])
    end
  end
end