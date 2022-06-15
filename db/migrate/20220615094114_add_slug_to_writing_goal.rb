class AddSlugToWritingGoal < ActiveRecord::Migration[7.0]
  def change
    add_column :writing_goals, :slug, :string
  end
end
