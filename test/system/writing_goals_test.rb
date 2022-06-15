require "application_system_test_case"

class WritingGoalsTest < ApplicationSystemTestCase
  setup do
    @writing_goal = writing_goals(:one)
  end

  test "visiting the index" do
    visit writing_goals_url
    assert_selector "h1", text: "Writing goals"
  end

  test "should create writing goal" do
    visit writing_goals_url
    click_on "New writing goal"

    fill_in "Book", with: @writing_goal.book_id
    fill_in "Finish on", with: @writing_goal.finish_on
    fill_in "Start on", with: @writing_goal.start_on
    fill_in "Summary", with: @writing_goal.summary
    fill_in "Target", with: @writing_goal.target
    click_on "Create Writing goal"

    assert_text "Writing goal was successfully created"
    click_on "Back"
  end

  test "should update Writing goal" do
    visit writing_goal_url(@writing_goal)
    click_on "Edit this writing goal", match: :first

    fill_in "Book", with: @writing_goal.book_id
    fill_in "Finish on", with: @writing_goal.finish_on
    fill_in "Start on", with: @writing_goal.start_on
    fill_in "Summary", with: @writing_goal.summary
    fill_in "Target", with: @writing_goal.target
    click_on "Update Writing goal"

    assert_text "Writing goal was successfully updated"
    click_on "Back"
  end

  test "should destroy Writing goal" do
    visit writing_goal_url(@writing_goal)
    click_on "Destroy this writing goal", match: :first

    assert_text "Writing goal was successfully destroyed"
  end
end
