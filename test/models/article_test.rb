require 'test_helper'

class ArticleTest < ActiveJob::TestCase
  test "job" do
    @article= Article.new(id: 1,title: "TITLE 1",description: "DESCRIPTION OF ARTICLE 1")
    @article.save
    assert_enqueued_jobs 1 do
    SendingArticlesToUsersJob.perform_later(@article)
    end
    # assert @article.reload.create?
   end
end
