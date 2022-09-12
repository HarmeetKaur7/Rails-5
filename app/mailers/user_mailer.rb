class UserMailer < ApplicationMailer
    def sending_article_to_user(article)
        @article=article
        mail(to: User.find(@article.user).email, subject: "Demo for Active job")
    end

    def invite 
        mail(to: "hamu20017@gmail.com", subject: "invitation")  # JUST FOR TESTING THE MAILER
    end

end
