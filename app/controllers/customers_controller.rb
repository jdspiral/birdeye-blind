class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save
    redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
