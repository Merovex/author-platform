require "application_system_test_case"

class CastMembersTest < ApplicationSystemTestCase
  setup do
    @cast_member = cast_members(:one)
  end

  test "visiting the index" do
    visit cast_members_url
    assert_selector "h1", text: "Cast members"
  end

  test "should create cast member" do
    visit cast_members_url
    click_on "New cast member"

    fill_in "Book", with: @cast_member.book_id
    fill_in "Character", with: @cast_member.character_id
    fill_in "Summary", with: @cast_member.summary
    click_on "Create Cast member"

    assert_text "Cast member was successfully created"
    click_on "Back"
  end

  test "should update Cast member" do
    visit cast_member_url(@cast_member)
    click_on "Edit this cast member", match: :first

    fill_in "Book", with: @cast_member.book_id
    fill_in "Character", with: @cast_member.character_id
    fill_in "Summary", with: @cast_member.summary
    click_on "Update Cast member"

    assert_text "Cast member was successfully updated"
    click_on "Back"
  end

  test "should destroy Cast member" do
    visit cast_member_url(@cast_member)
    click_on "Destroy this cast member", match: :first

    assert_text "Cast member was successfully destroyed"
  end
end
