require "test_helper"

class Admin::ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_item_genres_index_url
    assert_response :success
  end
end
