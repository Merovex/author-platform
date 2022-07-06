class AddNotificationsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :notify_when_added_to_bucket, :boolean, default:true
    add_column :users, :notify_when_release_book, :boolean, default:true
    add_column :users, :notify_when_broadcast_post, :boolean, default:true
    add_column :users, :notify_when_checkin, :boolean, default:true
    add_column :users, :notify_when_task_completed, :boolean, default:true

    User.all.each do |user|
      user.notify_when_added_to_bucket = true
      user.notify_when_release_book = true
      user.notify_when_broadcast_post = true
      user.notify_when_checkin = true
      user.notify_when_task_completed = true
      user.save
    end
  end
end
