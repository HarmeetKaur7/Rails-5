require 'test_helper'

#UNIT TESTING FOR ACTIVE JOB 'SendingArticlesToUsersJobTestS'

class SendingArticlesToUsersJobTest < ActiveJob::TestCase

   test "job" do
    @article= Article.new(id: 1,title: "TITLE 1",description: "DESCRIPTION OF ARTICLE 1")
    @article.save
    assert_enqueued_jobs 1 do
    SendingArticlesToUsersJob.perform_later(@article)
    end
    # assert @article.reload.create?
   end
end
