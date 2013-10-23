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
      unless @work.thumb.nil?
        @work.thumb = crop_image(@work.thumb)
      end
      if @work.save
    	redirect_to admin_project_works_url(@project), notice: 'work was successful created'
      else
    	render action: "new"
      end
    end

    def update
      @work = @project.works.find(params[:id])
      if @work.update_attributes(params[:work])
        unless params[:work][:thumb].nil?
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

    def crop_image(thumb)
      avatar_path = Rails.root + "public/uploads/image"
      photo_name = "thumb.jpg"
      img = MiniMagick::Image.from_blob(thumb.read)
      Dir.chdir avatar_path
      img.write "#{photo_name}"
      img = MiniMagick::Image.open("#{photo_name}")  
      width = params[:x2].to_i - params[:x1].to_i  
      height= params[:y2].to_i - params[:y1].to_i 
      img.crop "#{width}x#{height}+#{params[:x1]}+#{params[:y1]}"  
      thumb = img
    end
  end
end