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

  def life
    @css = "life_index"
  end

  def lifepost
    @css = "life_show"
  end

end
