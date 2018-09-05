require 'test_helper'

class TesterControllerTest < ActionDispatch::IntegrationTest
  test "should get order" do
    get tester_order_url
    assert_response :success
  end

end
