require "application_system_test_case"

class SubscribersTest < ApplicationSystemTestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "visiting the index" do
    visit subscribers_url
    assert_selector "h1", text: "Subscribers"
  end

  test "should create Subscriber" do
    visit subscribers_url
    click_on "New Subscriber"

    fill_in "Ahoy visit", with: @subscriber.ahoy_visit_id
    fill_in "Confirmation sent at", with: @subscriber.confirmation_sent_at
    fill_in "Confirmation token", with: @subscriber.confirmation_token
    fill_in "Confirmed at", with: @subscriber.confirmed_at
    fill_in "Email", with: @subscriber.email
    fill_in "User", with: @subscriber.user_id
    click_on "Create Subscriber"

    assert_text "Subscriber was successfully created"
    click_on "Back"
  end

  test "should update Subscriber" do
    visit subscribers_url
    click_on "Edit", match: :first

    fill_in "Ahoy visit", with: @subscriber.ahoy_visit_id
    fill_in "Confirmation sent at", with: @subscriber.confirmation_sent_at
    fill_in "Confirmation token", with: @subscriber.confirmation_token
    fill_in "Confirmed at", with: @subscriber.confirmed_at
    fill_in "Email", with: @subscriber.email
    fill_in "User", with: @subscriber.user_id
    click_on "Update Subscriber"

    assert_text "Subscriber was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscriber" do
    visit subscribers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscriber was successfully destroyed"
  end
end
