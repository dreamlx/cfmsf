module Admin
  class CareersController < Admin::BaseController
    # GET /admin/careers
    # GET /admin/careers.json
    def index
      @careers = Career.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

    # GET /admin/careers/1
    # GET /admin/careers/1.json
    def show
      @career = Career.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # GET /admin/careers/new
    # GET /admin/careers/new.json
    def new
      @career = Career.new

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /admin/careers/1/edit
    def edit
      @career = Career.find(params[:id])
    end

    # POST /admin/careers
    # POST /admin/careers.json
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

    # PUT /admin/careers/1
    # PUT /admin/careers/1.json
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

    # DELETE /admin/careers/1
    # DELETE /admin/careers/1.json
    def destroy
      @career = Career.find(params[:id])
      @career.destroy

      respond_to do |format|
        format.html { redirect_to admin_careers_path }
      end
    end
  end
end
