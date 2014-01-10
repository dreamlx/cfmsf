module Admin
  class ArticlesController < Admin::BaseController
    load_and_authorize_resource
    
    def index
      @current_category = Category.find(params[:category_id]) unless params[:category_id].blank?
      if @current_category.blank?
        @current_category = current_user.categories.first
      end
      @articles = Array.new
      @articles = @current_category.articles unless @current_category.blank?
    end

    def reject
      @article = Article.find(params[:id])
      @article.status = "pending"
      if @article.save
        redirect_to admin_articles_path(category_id: @article.category.id),
                                        notice: "article was successful reject"
      else
        render action:"edit", alert: "article was failed reject"
      end
    end

    def approve
      @article = Article.find(params[:id])
      @article.status = "public"
      if @article.save
        redirect_to admin_articles_path(category_id: @article.category.id),
                                        notice: "article was successful approve"
      else
        render action:"edit", alert: "article was failed approve"
      end
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
      if @article.update_attributes(params[:article])
        redirect_to admin_articles_path, notice: 'article was successful updated'
      else
        render action: "edit", alert: 'article was failed updated'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      if @article.update_attributes(status:"deleted")
        redirect_to admin_articles_path, notice: 'article was successful deleted'
      else
        render action: "index", alert: "article was failed deleted"
      end
    end
  end
end