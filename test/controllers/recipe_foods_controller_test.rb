require "test_helper"

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recipe_foods_show_url
    assert_response :success
  end
end
