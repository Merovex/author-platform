require "application_system_test_case"

class BindersTest < ApplicationSystemTestCase
  setup do
    @binder = binders(:one)
  end

  test "visiting the index" do
    visit binders_url
    assert_selector "h1", text: "Binders"
  end

  test "should create binder" do
    visit binders_url
    click_on "New binder"

    fill_in "Project", with: @binder.project_id
    fill_in "Type", with: @binder.type
    click_on "Create Binder"

    assert_text "Binder was successfully created"
    click_on "Back"
  end

  test "should update Binder" do
    visit binder_url(@binder)
    click_on "Edit this binder", match: :first

    fill_in "Project", with: @binder.project_id
    fill_in "Type", with: @binder.type
    click_on "Update Binder"

    assert_text "Binder was successfully updated"
    click_on "Back"
  end

  test "should destroy Binder" do
    visit binder_url(@binder)
    click_on "Destroy this binder", match: :first

    assert_text "Binder was successfully destroyed"
  end
end
