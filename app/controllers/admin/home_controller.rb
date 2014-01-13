module Admin
  
  class HomeController < Admin::BaseController
    def index
      @articles = Article.limit(25)
    end
  end
end