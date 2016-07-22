class SessionsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret"
  def new
  end

  def create
    @company = Company.find_by_email(params[:session][:email])
    if @company && @company.authenticate(params[:session][:password])
      session[:company_id] = @company.id
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to '/'
    else
      flash[:notice] = "There was an error logging in. Please try again."
      flash[:color] = "invalid"
      redirect_to '/companies/login'
    end
  end

  def destroy
    session[:company_id] = nil
    flash[:notice] = "You logged out successfully"
    flash[:color]= "valid"
    redirect_to '/'
  end

end
