class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save

    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

    # Create and send and SMS message
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: @customer.phone,
      body: 'https://goo.gl/Qn1PzK')
      redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
