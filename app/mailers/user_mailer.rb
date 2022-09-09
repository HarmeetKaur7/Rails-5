class UserMailer < ApplicationMailer
    def sending_article_to_user(article)
        @article=article
        mail(to: User.find(@article.user).email, subject: "Demo for Active job")
    end

end
