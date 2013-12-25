module Admin
  class ArticlesController < Admin::BaseController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(params[:article])
      if @article.save
        redirect_to admin_articles_path, notice: 'article was successful created'
      else
        render action: "new", alert: 'article was failed created'
      end
    end

    def update
      @article = Article.find(params[:id])
      if @article.save
        redirect_to admin_articles_path, notice: 'article was successful updated'
      else
        render action: "edit", alert: 'article was failed updated'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      if @article.destroy
        redirect_to admin_articles_path, notice: 'article was successful deleted'
      else
        render action: "index", alert: "article was failed deleted"
      end
    end
  end
end