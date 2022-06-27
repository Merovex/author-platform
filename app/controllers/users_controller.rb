class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def all
    @users = User.all
  end

  def show; end

  def me
    @user = current_user
    render 'users/show'
  end
end
