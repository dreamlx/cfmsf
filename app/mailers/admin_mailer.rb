class AdminMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def notice_email(user,article)
    @article = article
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Article '#{article.chinese_title}'' was updated")
  end
end
