# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#u = User.first; u.subscription.destroy; u.destroy; u = User.new(email: 'merovex@gmail.com').save