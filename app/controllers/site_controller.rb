class SiteController < ApplicationController

  def aboutus
    @css = "site_aboutus"
    recommendProjects
  end

  def services
    @css = "site_services"
  end

  def contact
    @css = "site_contact"
  end

  def security
    @css = "site_security"
  end

end
