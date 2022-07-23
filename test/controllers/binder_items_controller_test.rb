require "test_helper"

class BinderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @binder_item = binder_items(:one)
  end

  test "should get index" do
    get binder_items_url
    assert_response :success
  end

  test "should get new" do
    get new_binder_item_url
    assert_response :success
  end

  test "should create binder_item" do
    assert_difference("BinderItem.count") do
      post binder_items_url, params: { binder_item: { ancestry: @binder_item.ancestry, name: @binder_item.name, project_id: @binder_item.project_id, synopsis: @binder_item.synopsis } }
    end

    assert_redirected_to binder_item_url(BinderItem.last)
  end

  test "should show binder_item" do
    get binder_item_url(@binder_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_binder_item_url(@binder_item)
    assert_response :success
  end

  test "should update binder_item" do
    patch binder_item_url(@binder_item), params: { binder_item: { ancestry: @binder_item.ancestry, name: @binder_item.name, project_id: @binder_item.project_id, synopsis: @binder_item.synopsis } }
    assert_redirected_to binder_item_url(@binder_item)
  end

  test "should destroy binder_item" do
    assert_difference("BinderItem.count", -1) do
      delete binder_item_url(@binder_item)
    end

    assert_redirected_to binder_items_url
  end
end
