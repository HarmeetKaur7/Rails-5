require 'test_helper'

class CategoryFlowsTest < ActionDispatch::IntegrationTest

    test "get new form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
        post categories_path, params: { category: { name: "Thriller"} }
        assert_response :redirect
    end

    follow_redirect!
    assert_response :success
    assert_select "h1", "Showing category details"
  end
end


  # test "can see the title" do
  #   get "/"
  #   assert_select "h1","BLOG"
  # end

  # # test "post a new article" do
  # #   get "/articles/new"
  # #   assert_response :success
  # #   post "/articles", params: {article: {title: "Article for integration test", description: "Hi from integration testing"}}
  # #   # assert_equal "Article was successfully saved !",flash[:notice]
  # #   assert_response :success
  # #   # follow_redirect!
  # #   assert_select "p", "Title /n Article for integration test"
  # # end

  # test "login of a user" do
  #   get "/login"
  #   assert_response :success
  #   post "/login", params: {session: {email: "aaa@gmail.com", password: "password123"}}
  #   # assert_response :redirect
  #   # assert_equal "login Successful AAA !",flash[:notice]
  #   assert_equal "Wrong Credentials  !",flash.now[:alert]
  # end