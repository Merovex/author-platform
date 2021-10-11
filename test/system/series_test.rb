require "application_system_test_case"

class SeriesTest < ApplicationSystemTestCase
  setup do
    @series = series(:one)
  end

  test "visiting the index" do
    visit series_url
    assert_selector "h1", text: "Series"
  end

  test "should create Series" do
    visit series_url
    click_on "New Series"

    fill_in "Slug", with: @series.slug
    fill_in "Synopsis", with: @series.synopsis
    fill_in "Title", with: @series.title
    click_on "Create Series"

    assert_text "Series was successfully created"
    click_on "Back"
  end

  test "should update Series" do
    visit series_url
    click_on "Edit", match: :first

    fill_in "Slug", with: @series.slug
    fill_in "Synopsis", with: @series.synopsis
    fill_in "Title", with: @series.title
    click_on "Update Series"

    assert_text "Series was successfully updated"
    click_on "Back"
  end

  test "should destroy Series" do
    visit series_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Series was successfully destroyed"
  end
end
