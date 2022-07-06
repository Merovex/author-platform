class AddUnsubscribeHashToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unsubscribe_hash, :string

    User.all.each do |user|
      user.add_unsubscribe_hash
      user.save
    end
  end
end
