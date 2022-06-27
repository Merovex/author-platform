class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user_from_token!
  before_action :set_current_user, if: :user_signed_in?
  # after_action :track_action

  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  # Its important that the location is NOT stored if:
  # - The request method is not GET (non important)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
  #    infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def track_action
    ahoy.track 'Ran action', request.path_parameters
  end

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    sign_in user, store: false if user && Devise.secure_compare(user.authentication_token, params[:user_token])
  end

  def ensure_frame_response
    return unless Rails.env.development?

    redirect_to root_path unless turbo_frame_request?
  end

  def set_current_user
    Current.user = current_user
  end
end
