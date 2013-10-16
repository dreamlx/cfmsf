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
      unless params[:albums].nil?
        params[:albums].each do |image|
          @work.albums << Album.create(:cover_image => image)
        end
      end
      if @work.save
    	redirect_to admin_project_works_url(@project), notice: 'work was successful created'
      else
    	render action: "new"
      end
    end

    def update
      binding.pry
      @work = @project.works.find(params[:id])
      if @work.update_attributes(params[:work])
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