require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get dashboard_index_url
    assert_response :success
  end

  test 'should get pages' do
    get dashboard_pages_url
    assert_response :success
  end

  test 'should get posts' do
    get dashboard_posts_url
    assert_response :success
  end

  test 'should get subscribers' do
    get dashboard_subscribers_url
    assert_response :success
  end
end
