require 'test_helper'

class BasicsControllerTest < ActionController::TestCase
  setup do
    @basic = basics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic" do
    assert_difference('Basic.count') do
      post :create, basic: { color: @basic.color, cost: @basic.cost, description: @basic.description, firstname: @basic.firstname, lastname: @basic.lastname, manufacturer: @basic.manufacturer }
    end

    assert_redirected_to basic_path(assigns(:basic))
  end

  test "should show basic" do
    get :show, id: @basic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic
    assert_response :success
  end

  test "should update basic" do
    patch :update, id: @basic, basic: { color: @basic.color, cost: @basic.cost, description: @basic.description, firstname: @basic.firstname, lastname: @basic.lastname, manufacturer: @basic.manufacturer }
    assert_redirected_to basic_path(assigns(:basic))
  end

  test "should destroy basic" do
    assert_difference('Basic.count', -1) do
      delete :destroy, id: @basic
    end

    assert_redirected_to basics_path
  end
end
