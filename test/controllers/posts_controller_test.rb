require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # include Devise::TestHelpers
  include Devise::Test::IntegrationHelpers

  # setup do
  #   @article = articles(:one)
  #   @admin = users(:admin)
  #   @expert = users(:expert)
  #   @user = users(:emelya)
  #   @student = users(:student)
  # end
  setup do
    @post = posts(:one)
    @admin = users(:admin)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @admin
    raise @admin.inspect

    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @admin
    assert_difference('Post.count') do
      post posts_url,
           params: { post: { published_at: @post.published_at, slug: @post.slug, title: @post.title,
                             user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    # sign_in @admin
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @admin
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    sign_in @admin
    patch post_url(@post),
          params: { post: { published_at: @post.published_at, slug: @post.slug, title: @post.title,
                            user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    sign_in @admin
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
