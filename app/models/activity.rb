# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  key            :string
#  owner_type     :string
#  parameters     :text
#  recipient_type :string
#  trackable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#  recipient_id   :integer
#  trackable_id   :integer
#
# Indexes
#
#  index_activities_on_owner_id_and_owner_type          (owner_id,owner_type)
#  index_activities_on_owner_type_and_owner_id          (owner_type,owner_id)
#  index_activities_on_recipient_id_and_recipient_type  (recipient_id,recipient_type)
#  index_activities_on_recipient_type_and_recipient_id  (recipient_type,recipient_id)
#  index_activities_on_trackable_id_and_trackable_type  (trackable_id,trackable_type)
#  index_activities_on_trackable_type_and_trackable_id  (trackable_type,trackable_id)
#
class Activity < ApplicationRecord

end
