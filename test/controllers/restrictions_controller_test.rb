require 'test_helper'

class RestrictionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get restrictions_new_url
    assert_response :success
  end

  test "should get create" do
    get restrictions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get restrictions_destroy_url
    assert_response :success
  end

end
