# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # def new
  #   cookies[:pre_signin_url] = request.referer
  #   super
  # end
  def destroy
    flash[:success] = 'It was good to see you. Please come again.'
    super
  end
  def authenticate_token
    user = User.find_by(authentication_token: params[:authentication_token])
    now = Time.now.utc
    if user.present? && user.authentication_token_expires_at > now
      user.update(authentication_token: SecureRandom.base64(12).tr('+/=',''), authentication_token_expires_at: now)
      sign_in(user)
      # destination_url = cookies[:pre_signin_url] || root_path
      # cookies.delete(:pre_signin_url) if cookies.key?(:pre_signin_url)
      # redirect_to destination_url
    else
      flash[:alert] = 'There was an error while authentication. Please enter your email again.'
      redirect_to new_user_session_path
    end
  end

  def email_confirmed
    @authentication_token = params[:token] if params[:token].present?
  end
end
