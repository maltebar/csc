require 'test_helper'

class ForumPostRepliesControllerTest < ActionController::TestCase
  setup do
    @forum_post_reply = forum_post_replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_post_replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_post_reply" do
    assert_difference('ForumPostReply.count') do
      post :create, forum_post_reply: {  }
    end

    assert_redirected_to forum_post_reply_path(assigns(:forum_post_reply))
  end

  test "should show forum_post_reply" do
    get :show, id: @forum_post_reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_post_reply
    assert_response :success
  end

  test "should update forum_post_reply" do
    patch :update, id: @forum_post_reply, forum_post_reply: {  }
    assert_redirected_to forum_post_reply_path(assigns(:forum_post_reply))
  end

  test "should destroy forum_post_reply" do
    assert_difference('ForumPostReply.count', -1) do
      delete :destroy, id: @forum_post_reply
    end

    assert_redirected_to forum_post_replies_path
  end
end
