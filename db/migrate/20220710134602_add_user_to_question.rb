class AddUserToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :user, null: true, foreign_key: true
    user = User.first
    Question.all.each do |q|
      q.user_id = user.id
      q.save
    end
  end
end
