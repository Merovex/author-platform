class RenameUserSubscriptionFlag < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :notify_when_added_to_bucket, :notify_when_added_to_project
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
