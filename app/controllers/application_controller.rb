class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  # private
  #   def record_not_found
  #     redirect_to '/errors#not_found'
  #     # redirect_to '/books#index'
  #   end
end
