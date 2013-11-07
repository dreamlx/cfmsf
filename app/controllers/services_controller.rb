class ServicesController < ApplicationController
	def index
		@css = "site_services"
	    recommendProjects
	    # @clients = Client.all
	    @services_1 = Client.where("service = 1")
	    @services_2 = Client.where("service = 2")
	    @services_3 = Client.where("service = 3")
	    @services_4 = Client.where("service = 4")
	    @services_5 = Client.where("service = 5")
	    @services_6 = Client.where("service = 6")

	    @clients = Client.all
	    @companyList = @clients.map{|c| c.company}.uniq
	end
end
