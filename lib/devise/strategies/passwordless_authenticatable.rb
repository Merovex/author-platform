require 'devise/strategies/authenticatable'
require_relative '../../../app/mailers/user_mailer'
module Devise
  module Strategies
    class PasswordlessAuthenticatable < Authenticatable
      include Rails.application.routes.url_helpers
      include Rails.application.routes.mounted_helpers

      def authenticate!
        if params[:user].present?
          user = User.find_by(email: params[:user][:email])
          if user&.update(
            authentication_token: SecureRandom.base64(6).tr('+/=', ''),
            authentication_token_expires_at: Time.now.utc + 10.minutes
          )
            url = Rails.application.routes.url_helpers.confirm_email_url(token: user.authentication_token)
            UserMailer.validate_email(User.first, url).deliver_now
            raise('We sent an authentication email to the email address you provided. Click that link to access the Insiders.')
          end
        end
      end
      class << self
        def default_url_options
          Rails.application.config.action_controller.default_url_options
        end
      end
    end
  end
end

Warden::Strategies.add(:passwordless_authenticatable, Devise::Strategies::PasswordlessAuthenticatable)
