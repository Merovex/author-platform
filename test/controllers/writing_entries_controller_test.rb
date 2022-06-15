require "test_helper"

class WritingEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @writing_entry = writing_entries(:one)
  end

  test "should get index" do
    get writing_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_writing_entry_url
    assert_response :success
  end

  test "should create writing_entry" do
    assert_difference("WritingEntry.count") do
      post writing_entries_url, params: { writing_entry: { comment: @writing_entry.comment, count: @writing_entry.count, wrote_on: @writing_entry.wrote_on } }
    end

    assert_redirected_to writing_entry_url(WritingEntry.last)
  end

  test "should show writing_entry" do
    get writing_entry_url(@writing_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_writing_entry_url(@writing_entry)
    assert_response :success
  end

  test "should update writing_entry" do
    patch writing_entry_url(@writing_entry), params: { writing_entry: { comment: @writing_entry.comment, count: @writing_entry.count, wrote_on: @writing_entry.wrote_on } }
    assert_redirected_to writing_entry_url(@writing_entry)
  end

  test "should destroy writing_entry" do
    assert_difference("WritingEntry.count", -1) do
      delete writing_entry_url(@writing_entry)
    end

    assert_redirected_to writing_entries_url
  end
end
