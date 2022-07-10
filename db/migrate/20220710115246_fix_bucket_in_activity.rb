class FixBucketInActivity < ActiveRecord::Migration[7.0]
  def change
    Activity.where(trackable_type: 'Bucket').each do |a|
       a.key = 'project.create'
       a.trackable_type = 'Project'
       a.save
    end
  end
end
