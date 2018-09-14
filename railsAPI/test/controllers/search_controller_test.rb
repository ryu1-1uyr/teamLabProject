require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get puroduct" do
    get search_puroduct_url
    assert_response :success
  end

end
