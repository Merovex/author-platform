class SetUnrecordedPublicActivities < ActiveRecord::Migration[7.0]
  def change
    owner = User.find_by(email: 'ben@merovex.com')
    Answer.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Book.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Bucket.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Comment.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Post.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Praise.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Question.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Series.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Todo.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
    Todolist.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner: owner
    end
  end
end
