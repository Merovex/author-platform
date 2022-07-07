class ChangeInvolvedToCommittedOnMemberships < ActiveRecord::Migration[7.0]
  def change
    rename_column :memberships, :involved, :committed
    change_column_default :memberships, :committed, from: false, to: true
  end
end
