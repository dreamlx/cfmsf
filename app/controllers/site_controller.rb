class SiteController < ApplicationController

  def aboutus
    @css = "site_aboutus"
    recommendProjects
  end

  def contact
    @css = "site_contact"
    recommendProjects
  end

  def security
    @css = "site_security"
    recommendProjects
  end

end
