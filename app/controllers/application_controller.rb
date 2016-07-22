class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_company

  def current_company
    # Company.find(session[:company_id])
    if session[:company_id]
      @current_company = session[:company_id]
    else
      # redirect_to '/companies/login'
    end
    # @current_company ||= Company.find(session[:company_id]) if session[:company_id]
  end
  def require_company
    redirect_to '/companies/login' unless current_company
  end

end
