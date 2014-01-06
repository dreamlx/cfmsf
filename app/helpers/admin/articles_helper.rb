module Admin::ArticlesHelper
  def article_status_class(article)
  	if article.status == "pending"
  	  return "error"
  	elsif article.status == "public"
      return "success"
    elsif article.status == "deleted"
      return "warning"
  	end
  end
end
