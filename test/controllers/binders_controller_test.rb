require "test_helper"

class BindersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @binder = binders(:one)
  end

  test "should get index" do
    get binders_url
    assert_response :success
  end

  test "should get new" do
    get new_binder_url
    assert_response :success
  end

  test "should create binder" do
    assert_difference("Binder.count") do
      post binders_url, params: { binder: { project_id: @binder.project_id, type: @binder.type } }
    end

    assert_redirected_to binder_url(Binder.last)
  end

  test "should show binder" do
    get binder_url(@binder)
    assert_response :success
  end

  test "should get edit" do
    get edit_binder_url(@binder)
    assert_response :success
  end

  test "should update binder" do
    patch binder_url(@binder), params: { binder: { project_id: @binder.project_id, type: @binder.type } }
    assert_redirected_to binder_url(@binder)
  end

  test "should destroy binder" do
    assert_difference("Binder.count", -1) do
      delete binder_url(@binder)
    end

    assert_redirected_to binders_url
  end
end
