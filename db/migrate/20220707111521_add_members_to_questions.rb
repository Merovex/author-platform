class AddMembersToQuestions < ActiveRecord::Migration[7.0]
  def change
    Question.all.each { |q| q.memberships.create(user_id: User.first.id) }
    Project.all.each { |q| q.memberships.create(user_id: User.first.id) }
  end
end
