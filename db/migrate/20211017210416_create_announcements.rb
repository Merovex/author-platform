class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :summary
      t.datetime :published_at
      t.string :announceable_id
      t.string :announceable_type

      t.timestamps
    end
  end
end
