require "test_helper"

class CastMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cast_member = cast_members(:one)
  end

  test "should get index" do
    get cast_members_url
    assert_response :success
  end

  test "should get new" do
    get new_cast_member_url
    assert_response :success
  end

  test "should create cast_member" do
    assert_difference("CastMember.count") do
      post cast_members_url, params: { cast_member: { book_id: @cast_member.book_id, character_id: @cast_member.character_id, summary: @cast_member.summary } }
    end

    assert_redirected_to cast_member_url(CastMember.last)
  end

  test "should show cast_member" do
    get cast_member_url(@cast_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_cast_member_url(@cast_member)
    assert_response :success
  end

  test "should update cast_member" do
    patch cast_member_url(@cast_member), params: { cast_member: { book_id: @cast_member.book_id, character_id: @cast_member.character_id, summary: @cast_member.summary } }
    assert_redirected_to cast_member_url(@cast_member)
  end

  test "should destroy cast_member" do
    assert_difference("CastMember.count", -1) do
      delete cast_member_url(@cast_member)
    end

    assert_redirected_to cast_members_url
  end
end
