module Admin
  
  class HomeController < Admin::BaseController
    def index
      @articles = Article.where("status != ?", "deleted").limit(25).order("created_at desc")
    end
  end
end