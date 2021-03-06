class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def render_404
    respond_to do |format|
      format.html { render :file => 'public/404', :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def render_403
    respond_to do |format|
      format.html { render :file => 'public/403', :layout => false, :status => :forbidden }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end
