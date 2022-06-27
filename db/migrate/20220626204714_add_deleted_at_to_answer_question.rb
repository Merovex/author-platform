class AddDeletedAtToAnswerQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :deleted_at, :datetime, index: true
    add_column :questions, :deleted_at, :datetime, index: true
  end
end
