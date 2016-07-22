class CompaniesController < ApplicationController
  http_basic_authenticate_with name: "birdeye", password: "password"
  # before_action :require_user, only: [:new, :create]
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      session[:company_id] = @company.id
      redirect_to '/'
    else
      redirect_to '/companies/signup'
    end
  end

  def show
    # @company = Company.find(params[:id])
    # @customers = @company.customers
  end

  private

    def company_params
      params.require(:company).permit(:name, :phone, :email, :facebook, :google, :password, :twilio_phone)
    end
end
