module Admin
  class SlidesController < Admin::BaseController
    before_filter :find_slide, except: [:index, :new, :create]

  	def index
  	  @slides = Slide.order("id desc")
  	end

  	def create
  	  @slide = Slide.new(params[:slide])
  	  if @slide.save
  	  	redirect_to admin_slides_path, notice: 'slide was successful created'
  	  else
  	  	render action: "new"
  	  end
  	end

  	def destroy
  	  @slide.destroy
  	  redirect_to admin_slides_path, notice: 'slide was successful deleted'
  	end

  	def new
  	  @slide = Slide.new
  	end

    def edit
    end

    def update
      if @slide.update_attributes(params[:slide])
        redirect_to admin_slides_path, notice: 'slide was successful update'
      else
        render action: "edit"
      end
    end

    def find_slide
      @slide = Slide.find(params[:id])
    end
  end
end