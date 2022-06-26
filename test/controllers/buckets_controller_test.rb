require "test_helper"

class WritingGoalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bucket = buckets(:one)
  end

  test "should get index" do
    get buckets_url
    assert_response :success
  end

  test "should get new" do
    get new_bucket_url
    assert_response :success
  end

  test "should create bucket" do
    assert_difference("WritingGoal.count") do
      post buckets_url, params: { bucket: { book_id: @bucket.book_id, finish_on: @bucket.finish_on, start_on: @bucket.start_on, summary: @bucket.summary, target: @bucket.target } }
    end

    assert_redirected_to bucket_url(WritingGoal.last)
  end

  test "should show bucket" do
    get bucket_url(@bucket)
    assert_response :success
  end

  test "should get edit" do
    get edit_bucket_url(@bucket)
    assert_response :success
  end

  test "should update bucket" do
    patch bucket_url(@bucket), params: { bucket: { book_id: @bucket.book_id, finish_on: @bucket.finish_on, start_on: @bucket.start_on, summary: @bucket.summary, target: @bucket.target } }
    assert_redirected_to bucket_url(@bucket)
  end

  test "should destroy bucket" do
    assert_difference("WritingGoal.count", -1) do
      delete bucket_url(@bucket)
    end

    assert_redirected_to buckets_url
  end
end
