require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    # get :index
    assert_response :success
  end

  test "should get show" do
    user = users(:armada)
    get :show, id: user
    assert_response :success
  end
end
