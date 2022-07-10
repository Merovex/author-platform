# == Schema Information
#
# Table name: users
#
#  id                              :bigint           not null, primary key
#  authentication_token            :string
#  authentication_token_expires_at :datetime
#  confirmation_sent_at            :datetime
#  confirmation_token              :string
#  confirmed_at                    :datetime
#  current_sign_in_at              :datetime
#  current_sign_in_ip              :string
#  email                           :string           default(""), not null
#  encrypted_password              :string           default(""), not null
#  failed_attempts                 :integer          default(0), not null
#  last_sign_in_at                 :datetime
#  last_sign_in_ip                 :string
#  locked_at                       :datetime
#  name                            :string
#  notify_when_added_to_project    :boolean          default(TRUE)
#  notify_when_broadcast_post      :boolean          default(TRUE)
#  notify_when_checkin             :boolean          default(TRUE)
#  notify_when_release_book        :boolean          default(TRUE)
#  notify_when_task_completed      :boolean          default(TRUE)
#  remember_created_at             :datetime
#  reset_password_sent_at          :datetime
#  reset_password_token            :string
#  sign_in_count                   :integer          default(0), not null
#  slug                            :string
#  unconfirmed_email               :string
#  unlock_token                    :string
#  unsubscribe_hash                :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    assert_not user.save, 'Saved the User without an email address'
  end
  test 'should not save user with email' do
    user = User.new(email: 'text@example.com')
    assert user.save, 'Saved the User with an email address'
  end
  test 'the truth' do
    assert true
  end
end
