# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   user_name:      'apikey',
#   password:       ENV['SENDGRID_PASSWORD'],
#   # password:       Rails.application.credentials.dig(:sendgrid, :api_key),
#   domain:         'merovex-author-website.herokuapp.com',
#   address:        "smtp.sendgrid.net",
#   port:            587,
#   authentication: :plain,
#   enable_starttls_auto: true
# }
#u = User.first; u.subscription.destroy; u.destroy; u = User.new(email: 'merovex@gmail.com').save