class ServicesController < ApplicationController
	def index
		@css = "site_services"
	    recommendProjects
	    @clients = Client.all
	end
end
