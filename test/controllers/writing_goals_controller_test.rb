require "test_helper"

class WritingGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @writing_goal = writing_goals(:one)
  end

  test "should get index" do
    get writing_goals_url
    assert_response :success
  end

  test "should get new" do
    get new_writing_goal_url
    assert_response :success
  end

  test "should create writing_goal" do
    assert_difference("WritingGoal.count") do
      post writing_goals_url, params: { writing_goal: { book_id: @writing_goal.book_id, finish_on: @writing_goal.finish_on, start_on: @writing_goal.start_on, summary: @writing_goal.summary, target: @writing_goal.target } }
    end

    assert_redirected_to writing_goal_url(WritingGoal.last)
  end

  test "should show writing_goal" do
    get writing_goal_url(@writing_goal)
    assert_response :success
  end

  test "should get edit" do
    get edit_writing_goal_url(@writing_goal)
    assert_response :success
  end

  test "should update writing_goal" do
    patch writing_goal_url(@writing_goal), params: { writing_goal: { book_id: @writing_goal.book_id, finish_on: @writing_goal.finish_on, start_on: @writing_goal.start_on, summary: @writing_goal.summary, target: @writing_goal.target } }
    assert_redirected_to writing_goal_url(@writing_goal)
  end

  test "should destroy writing_goal" do
    assert_difference("WritingGoal.count", -1) do
      delete writing_goal_url(@writing_goal)
    end

    assert_redirected_to writing_goals_url
  end
end
