# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#   :password => '<SENDGRID_API_KEY>', # This is the secret sendgrid API key which was issued during API key creation
#   :domain => 'yourdomain.com',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
# }
ActionMailer::Base.smtp_settings = {
  domain:         'merovex-author-website.herokuapp.com',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       Rails.application.credentials.dig(:sendgrid, :api_key),
  enable_starttls_auto: true
}