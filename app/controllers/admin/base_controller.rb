module Admin
  
  class BaseController < ApplicationController
    before_filter :authenticate_user!
    layout 'admin'

    def crop_image(thumb)
      avatar_path = Rails.root + "public/uploads/image"
      photo_name = thumb.original_filename
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