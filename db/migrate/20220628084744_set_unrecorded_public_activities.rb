class SetUnrecordedPublicActivities < ActiveRecord::Migration[7.0]
  def change
    owner = User.find_by(email: 'ben@merovex.com')
    Answer.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Book.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Bucket.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Comment.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Post.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Praise.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Question.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Series.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Todo.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
    Todolist.find_each do |record|
      record.create_activity :create, created_at: record.created_at, updated_at: record.created_at, owner:
    end
  end
end
