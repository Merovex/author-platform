require "application_system_test_case"

class BinderItemsTest < ApplicationSystemTestCase
  setup do
    @binder_item = binder_items(:one)
  end

  test "visiting the index" do
    visit binder_items_url
    assert_selector "h1", text: "Binder items"
  end

  test "should create binder item" do
    visit binder_items_url
    click_on "New binder item"

    fill_in "Ancestry", with: @binder_item.ancestry
    fill_in "Name", with: @binder_item.name
    fill_in "Project", with: @binder_item.project_id
    fill_in "Synopsis", with: @binder_item.synopsis
    click_on "Create Binder item"

    assert_text "Binder item was successfully created"
    click_on "Back"
  end

  test "should update Binder item" do
    visit binder_item_url(@binder_item)
    click_on "Edit this binder item", match: :first

    fill_in "Ancestry", with: @binder_item.ancestry
    fill_in "Name", with: @binder_item.name
    fill_in "Project", with: @binder_item.project_id
    fill_in "Synopsis", with: @binder_item.synopsis
    click_on "Update Binder item"

    assert_text "Binder item was successfully updated"
    click_on "Back"
  end

  test "should destroy Binder item" do
    visit binder_item_url(@binder_item)
    click_on "Destroy this binder item", match: :first

    assert_text "Binder item was successfully destroyed"
  end
end
