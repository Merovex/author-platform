# frozen_string_literal: true
# https://www.mintbit.com/blog/passwordless-authentication-in-ruby-on-rails-with-devise
class Users::SessionsController < Devise::SessionsController
  before_action :pre_signin_url, only: %i[authenticate_token]
  before_action :delete_pre_signin_cookie, only: %i[new pre_signin_url]
  def new
    cookies[:pre_signin_url] = { 
      value: URI(request.referer),
      expires: 10.minutes.from_now
     } unless request.referer.nil?
    super
  end
  def destroy
    flash[:success] = 'It was good to see you. Please come again.'
    super
  end
  def authenticate_token
    user = User.find_by(authentication_token: params[:authentication_token])
    now = Time.now.utc
    if user.present? && user.authentication_token_expires_at > now
      user.update(
        authentication_token: SecureRandom.base64(12).tr('+/=',''),
        authentication_token_expires_at: now
      )
      sign_in(user)
      redirect_to @destination_url
    else
      flash[:alert] = 'There was an error while authentication. Please enter your email again.'
      redirect_to new_user_session_path
    end
  end

  def email_confirmed
    @authentication_token = params[:token] if params[:token].present?
  end
  protected 
  def delete_pre_signin_cookie
    cookies.delete(:pre_signin_url) if cookies.key?(:pre_signin_url)
  end
  def pre_signin_url
    @destination_url = cookies[:pre_signin_url] || root_path
  end
end
