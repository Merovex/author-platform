class ApplicationController < ActionController::Base
  include Pagy::Backend
  layout 'application'
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user_from_token!
  before_action :set_current_user, if: :user_signed_in?
  # around_filter :user_time_zone, if: Current.user
  # after_action :track_action

  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  def render_flash
    render turbo_stream: turbo_stream.update("flash", partial: "shared/flash")
  end

  private
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
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
  def forbid_them
    redirect_to root_path
  end
  def set_current_user
    Current.user = current_user
    Current.timezone = cookies[:tz].nil? ? "America/Chicago" : cookies[:tz]
    # tz = ActiveSupport::TimeZone[Current.timezone]
  end
end
