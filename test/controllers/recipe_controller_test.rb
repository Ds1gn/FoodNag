require 'test_helper'

class RecipeControllerTest < ActionController::TestCase
  test "should get ingredient" do
    get :ingredient
    assert_response :success
  end

end
