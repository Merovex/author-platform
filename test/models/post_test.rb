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

  context 'associations' do
    # should have_many(:comments)
    # should belong_to(:user)
    # should have_one(:bucket)
    # should have_many(:authors)
    should have_rich_text(:content)
    # should have_rich_text(:excerpt)
    should have_many_attached(:images)
    # should have_one_attached(:hero_background)
  end
  context 'validations' do
    should validate_presence_of(:title)
    # should validate_presence_of(:synopsis)
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
