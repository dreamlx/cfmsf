module Admin
  class ArticlesController < Admin::BaseController
    load_and_authorize_resource
    
    def index
      @topmenus = current_user.categories.all.reject{ |c| !c.is_topmenu? }
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
                                        notice: "success_reject"
      else
        render action:"edit", alert: "failed_reject"
      end
    end

    def approve
      @article = Article.find(params[:id])
      @article.status = "public"
      if @article.save
        redirect_to admin_articles_path(category_id: @article.category.id),
                                        notice: "success_approve"
      else
        render action:"edit", alert: "failed_approve"
      end
    end

    def new
      @article = Article.new
      @current_category = Category.find(params[:category_id]) unless params[:category_id].blank?
    end

    def edit
      @article = Article.find(params[:id])
    end


    def create
      @article = Article.new(params[:article])
      if @article.save
        AdminMailer.notice_email(User.find_by_username('admin'), @article).deliver
        redirect_to admin_articles_path(category_id: @article.category_id), notice: 'article_success_created'
      else
        render action: "new", alert: 'article_failed_created'
      end
    end

    def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        AdminMailer.notice_email(User.find_by_username('admin'), @article).deliver
        redirect_to edit_admin_article_path(@article), notice: 'article_success_updated'
      else
        render action: "edit", alert: 'article_failed_updated'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      if @article.update_attributes(status:"deleted")
        redirect_to admin_articles_path(category_id: @article.category_id), notice: 'article_success_deleted'
      else
        redirect_to admin_articles_path(category_id: @article.category_id), alert: "article_failed_deleted"
      end
    end
  end
end