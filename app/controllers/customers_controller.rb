class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save

    client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])

    # Create and send and SMS message
    client.account.messages.create(
      from: ENV['from'],
      to: @customer.phone,
      body: 'Hi, please review at https://www.facebook.com/217yorktown/reviews'
      )
      redirect_to root_path
  end



  private

  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
