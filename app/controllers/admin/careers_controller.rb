module Admin
  class CareersController < Admin::BaseController
    def index
      @careers = Career.order("id desc")
    end

    def show
      @career = Career.find(params[:id])
    end

    def new
      @career = Career.new
    end

    def edit
      @career = Career.find(params[:id])
    end

    def create
      @career = Career.new(params[:career])

      respond_to do |format|
        if @career.save
          format.html { redirect_to admin_careers_path, notice: 'Career was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    def update
      @career = Career.find(params[:id])

      respond_to do |format|
        if @career.update_attributes(params[:career])
          format.html { redirect_to admin_careers_path, notice: 'Career was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    def destroy
      @career = Career.find(params[:id])
      @career.destroy
      format.html { redirect_to admin_careers_path }
    end
  end
end
