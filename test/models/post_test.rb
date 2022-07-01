require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    Current.user = users(:one)
  end
  def valid_params(options = {})
    { 
      title: "Test Post",
      # synopsis: "<div>This is a test book.</div>",
    }.merge(options)
  end
  test "the truth" do
    assert true
  end
  test "Post should have a user" do 
    post = Post.new(valid_params)
    assert post.save, post.errors.full_messages.to_s
    assert post.user == Current.user, post.errors.full_messages.to_s
  end
  # Post should have a title.
  test "post should have a title" do
    post = Post.new
    assert_not post.save.nil?, post.errors.full_messages.to_s
    post.title = "title"
    assert post.save, post.errors.full_messages.to_s
  end
  test "post should default to unpublshed" do
    post = Post.create(valid_params)
    assert_not post.is_published?, post.errors.full_messages.to_s
    assert_not Post.published.include?(post), post.errors.full_messages.to_s
    assert Post.unpublished.include?(post), post.errors.full_messages.to_s
  end
  test "Published post should be published" do
    post = Post.create(valid_params(published_at: DateTime.now))
    assert post.is_published?, post.errors.full_messages.to_s
    assert_not Post.unpublished.include?(post), post.errors.full_messages.to_s
    assert Post.published.include?(post), post.errors.full_messages.to_s
  end
  test "published post should be broadcastable" do
    
    post = Post.create(valid_params(published_at: DateTime.now))
    post2 = Post.create(valid_params(broadcasted_at: DateTime.now, published_at: DateTime.now))
    assert post.broadcastable?, post.errors.full_messages.to_s
    assert_not post2.broadcastable?, post2.errors.full_messages.to_s
  end
  test "publishing an unpublished post should publish it" do
    post = Post.create(valid_params)
    post.publish_now
    assert post.is_published?, post.errors.full_messages.to_s
  end
  test "unpublishing a published post should unpublish it" do
    post = Post.create(valid_params(published_at: DateTime.now))
    post.unpublish
    assert_not post.is_published?, post.errors.full_messages.to_s
  end
  test 'deleted post should still be there' do
    post = Post.create(valid_params)
    post.destroy
    assert Post.with_deleted.where(id: post.id), post.errors.full_messages.to_s
  end
end
