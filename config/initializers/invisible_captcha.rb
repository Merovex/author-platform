InvisibleCaptcha.setup do |config|
  config.honeypots += %w[unpassword never_name snusername sirname]
  # config.visual_honeypots    = true
  # config.timestamp_threshold = 2
  # config.timestamp_enabled   = true
  # config.injectable_styles   = false
  # config.spinner_enabled     = true

  # Leave these unset if you want to use I18n (see below)
  config.sentence_for_humans = 'skip this field'
  # config.timestamp_error_message = 'Sorry, that was too quick! Please resubmit.'
end
