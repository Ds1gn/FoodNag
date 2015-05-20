require 'test_helper'

class ExpirationsControllerTest < ActionController::TestCase
  setup do
    @expiration = expirations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expirations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expiration" do
    assert_difference('Expiration.count') do
      post :create, expiration: { expires_at: @expiration.expires_at, food_id: @expiration.food_id, user_id: @expiration.user_id }
    end

    assert_redirected_to expiration_path(assigns(:expiration))
  end

  test "should show expiration" do
    get :show, id: @expiration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expiration
    assert_response :success
  end

  test "should update expiration" do
    patch :update, id: @expiration, expiration: { expires_at: @expiration.expires_at, food_id: @expiration.food_id, user_id: @expiration.user_id }
    assert_redirected_to expiration_path(assigns(:expiration))
  end

  test "should destroy expiration" do
    assert_difference('Expiration.count', -1) do
      delete :destroy, id: @expiration
    end

    assert_redirected_to expirations_path
  end
end
