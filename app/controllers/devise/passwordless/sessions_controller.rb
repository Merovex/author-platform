# frozen_string_literal: true

class Devise::Passwordless::SessionsController < Devise::SessionsController
  def create
    self.resource = resource_class.find_by(email: create_params[:email])
    respond_to do |format|
      resource.send_magic_link(create_params[:remember_me]) if resource
      # end
      set_flash_message(:notice, :magic_link_sent)
      format.html { redirect_to :root }
    end
  end

  protected

  def translation_scope
    if action_name == 'create'
      'devise.passwordless'
    else
      super
    end
  end

  private

  def create_params
    resource_params.permit(:email, :remember_me)
  end
end
