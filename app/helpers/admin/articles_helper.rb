module Admin::ArticlesHelper
  def article_status_class(article)
  	if article.status == "pending"
  	  return "error"
  	else
      return "success"
  	end
  end
end
