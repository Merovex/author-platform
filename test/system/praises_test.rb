require "application_system_test_case"

class PraisesTest < ApplicationSystemTestCase
  setup do
    @praise = praises(:one)
  end

  test "visiting the index" do
    visit praises_url
    assert_selector "h1", text: "Praises"
  end

  test "should create Praise" do
    visit praises_url
    click_on "New Praise"

    fill_in "Book", with: @praise.book_id
    click_on "Create Praise"

    assert_text "Praise was successfully created"
    click_on "Back"
  end

  test "should update Praise" do
    visit praises_url
    click_on "Edit", match: :first

    fill_in "Book", with: @praise.book_id
    click_on "Update Praise"

    assert_text "Praise was successfully updated"
    click_on "Back"
  end

  test "should destroy Praise" do
    visit praises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Praise was successfully destroyed"
  end
end
