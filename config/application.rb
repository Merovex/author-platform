require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AuthorPlatform
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.assets.initialize_on_precompile = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #.in_time_zone("Eastern Time (US & Canada)")
    # config.time_zone = 'Eastern Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_storage.variant_processor = :mini_magick
    config.to_prepare do 
      # some monkey patches
      Rails::Conductor::ActionMailbox::InboundEmailsController.class_eval do
        private
        def new_mail
          Mail.new(mail_params.except(:attachments).to_h).tap do |mail|
            mail[:bcc]&.include_in_headers = true
            mail_params[:attachments].to_a.compact_blank.each do |attachment|
              mail.add_file(filename: attachment.original_filename, content: attachment.read)
            end
          end
        end
      end    
    end
  end
end
