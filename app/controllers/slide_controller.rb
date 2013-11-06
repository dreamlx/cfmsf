class SlideController < ApplicationController
  def index
  	@slides = Slide.order("id desc")
  end
end