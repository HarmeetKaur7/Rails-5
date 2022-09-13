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

    test "job2" do
  @article= Article.new(id: 1,title: "TITLE 1",description: "DESCRIPTION OF ARTICLE 1")
  @article.save

  assert_enqueued_with(job: SendingArticlesToUsersJob ,args: [@article],at:  Date.tomorrow.noon) do
    SendingArticlesToUsersJob.set(wait_until: Date.tomorrow.noon).perform_later(@article)
  end
  # assert @article.reload.create?
 end
end
