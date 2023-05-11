require "test_helper"

class Admin::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_follows_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_follows_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_follows_destroy_url
    assert_response :success
  end
end
