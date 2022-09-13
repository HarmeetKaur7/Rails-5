# require 'test_helper'

class ArticlesControllerTest < ActiveJob::TestCase                 #ActionDispatch::IntegrationTest


 test "job" do
  @article= Article.new(id: 1,title: "TITLE 1",description: "DESCRIPTION OF ARTICLE 1")
  @article.save
  assert_enqueued_jobs 1 do
  SendingArticlesToUsersJob.perform_later(@article)
  end
  # assert @article.reload.create?
 end
# test "invite" do
#   assert_difference 'ActionMailer::Base.deliveries.count' ,+1 do
#     post :invite, params: {email: 'hamu20017@gmail.com'}
#   end

#   email=ActionMailer::Base.deliveries.last
#   assert_equal 'invitation',email.subject
#   assert_match(/Just checking invitations/, email.body.to_s)
#  end
end



  # setup do
  #   @article = articles(:one)
  # end

  # test "should get index" do
  #   get articles_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_article_url
  #   assert_response :success
  # end

  # test "should create article" do
  #   assert_difference('Article.count') do
  #     post articles_url, params: { article: {  } }
  #   end

  #   assert_redirected_to article_url(Article.last)
  # end

  # test "should show article" do
  #   get article_url(@article)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_article_url(@article)
  #   assert_response :success
  # end

  # test "should update article" do
  #   patch article_url(@article), params: { article: {  } }
  #   assert_redirected_to article_url(@article)
  # end

  # test "should destroy article" do
  #   assert_difference('Article.count', -1) do
  #     delete article_url(@article)
  #   end

  #   assert_redirected_to articles_url
  # end

