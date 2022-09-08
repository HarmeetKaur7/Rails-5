class SendingArticlesToUsersJob < ApplicationJob
  queue_as :default

  def perform(article)
    UserMailer.sending_article_to_user(article).deliver_now
    # "Do something later"
  end
end
