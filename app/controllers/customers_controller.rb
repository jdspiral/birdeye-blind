class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save

    client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])

    # Create and send and SMS message
    # default at no stars https://goo.gl/N9Oqv3
    # default to 5 stars https://goo.gl/cbj9qp
    client.account.messages.create(
      from: ENV['from'],
      to: @customer.phone,
      body: 'Thank you for visiting Sport Clips today, please give us a review - https://goo.gl/cbj9qp'
      )
      redirect_to root_path
  end



  private

  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
