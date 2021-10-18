require "application_system_test_case"

class AnnouncementsTest < ApplicationSystemTestCase
  setup do
    @announcement = announcements(:one)
  end

  test "visiting the index" do
    visit announcements_url
    assert_selector "h1", text: "Announcements"
  end

  test "should create Announcement" do
    visit announcements_url
    click_on "New Announcement"

    fill_in "Announceable", with: @announcement.announceable_id
    fill_in "Announceable type", with: @announcement.announceable_type
    fill_in "Published at", with: @announcement.published_at
    fill_in "Summary", with: @announcement.summary
    fill_in "Title", with: @announcement.title
    click_on "Create Announcement"

    assert_text "Announcement was successfully created"
    click_on "Back"
  end

  test "should update Announcement" do
    visit announcements_url
    click_on "Edit", match: :first

    fill_in "Announceable", with: @announcement.announceable_id
    fill_in "Announceable type", with: @announcement.announceable_type
    fill_in "Published at", with: @announcement.published_at
    fill_in "Summary", with: @announcement.summary
    fill_in "Title", with: @announcement.title
    click_on "Update Announcement"

    assert_text "Announcement was successfully updated"
    click_on "Back"
  end

  test "should destroy Announcement" do
    visit announcements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Announcement was successfully destroyed"
  end
end
