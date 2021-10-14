class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  private
  def set_click
    @click = Click.new

    ip = (request.remote_ip == '::1') ? "98.169.113.226" : request.remote_ip
    locx = Geocoder.search(ip).first

    @click.locate(locx)
    @click.save
  end
end
