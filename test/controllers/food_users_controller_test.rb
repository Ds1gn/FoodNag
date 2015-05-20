require 'test_helper'

class FoodUsersControllerTest < ActionController::TestCase
  setup do
    @food_user = food_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_user" do
    assert_difference('FoodUser.count') do
      post :create, food_user: { custom_reminder: @food_user.custom_reminder, food_id: @food_user.food_id, user_id: @food_user.user_id }
    end

    assert_redirected_to food_user_path(assigns(:food_user))
  end

  test "should show food_user" do
    get :show, id: @food_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_user
    assert_response :success
  end

  test "should update food_user" do
    patch :update, id: @food_user, food_user: { custom_reminder: @food_user.custom_reminder, food_id: @food_user.food_id, user_id: @food_user.user_id }
    assert_redirected_to food_user_path(assigns(:food_user))
  end

  test "should destroy food_user" do
    assert_difference('FoodUser.count', -1) do
      delete :destroy, id: @food_user
    end

    assert_redirected_to food_users_path
  end
end
