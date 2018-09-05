require 'test_helper'

class RecommendedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recommended_item = recommended_items(:one)
  end

  test "should get index" do
    get recommended_items_url, as: :json
    assert_response :success
  end

  test "should create recommended_item" do
    assert_difference('RecommendedItem.count') do
      post recommended_items_url, params: { recommended_item: { puroduct_id: @recommended_item.puroduct_id } }, as: :json
    end

    assert_response 201
  end

  test "should show recommended_item" do
    get recommended_item_url(@recommended_item), as: :json
    assert_response :success
  end

  test "should update recommended_item" do
    patch recommended_item_url(@recommended_item), params: { recommended_item: { puroduct_id: @recommended_item.puroduct_id } }, as: :json
    assert_response 200
  end

  test "should destroy recommended_item" do
    assert_difference('RecommendedItem.count', -1) do
      delete recommended_item_url(@recommended_item), as: :json
    end

    assert_response 204
  end
end
