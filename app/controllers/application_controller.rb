# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :user_signed_out?
  before_filter :find_site

  def user_signed_out?
    ! user_signed_in?
  end

  private
  
    def current_user_session
      user_session
    end

    def require_user
      authenticate_user!
    end
    
    def require_admin
      unless current_user && current_user.admin?
        flash[:notice] = "You must be an Admin to access this page"
        current_user ? redirect_to(account_url) : authenticate_user!
        return false
      end
    end
    
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be signed out to access this page"
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def find_site
      @site ||= SiteSetting.find(:first)
    end
    
end
