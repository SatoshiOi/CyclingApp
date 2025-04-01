require "test_helper"

class BikesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bikes_new_url
    assert_response :success
  end

  test "should get create" do
    get bikes_create_url
    assert_response :success
  end

  test "should get show" do
    get bikes_show_url
    assert_response :success
  end

  test "should get edit" do
    get bikes_edit_url
    assert_response :success
  end

  test "should get update" do
    get bikes_update_url
    assert_response :success
  end
end
