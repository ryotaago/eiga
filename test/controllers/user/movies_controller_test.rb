require "test_helper"

class User::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get user_movies_show_url
    assert_response :success
  end
end
