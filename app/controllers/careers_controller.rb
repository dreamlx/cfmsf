class CareersController < ApplicationController
	def index
		@careers = Career.all
		@css = "careers_index"
		recommendProjects
	end
end
