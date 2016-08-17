class CustomersController < ApplicationController
  before_action :require_company, only: [:new]

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def create
    @company = session[:company_id];

    @customer = Customer.new(customer_params.merge(:company_id => @company))

    @customer.save

    client = Twilio::REST::Client.new('AC3d4fcc78de34a2bbc8827773e3bdc6a1', 'd4ea49fe94103e0bf7bd15dae308f1b0')

    #@companyPhone = @company.where(twilio_phone: params[:twilio_phone]).first
    company_phone = Company.find_by_sql("SELECT twilio_phone FROM companies WHERE id = #{@company}" )

    # Create and send and SMS message
    # default at no stars https://goo.gl/N9Oqv3
    # default to 5 stars https://goo.gl/cbj9qp

    client.account.messages.create(
    # from: '14692919733',
      from: "#{company_phone[0].twilio_phone}",
      to: @customer.phone,
      body: 'Thank you for visiting Sport Clips today, please give us a review - https://goo.gl/cbj9qp'
      )
      redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :company_id)
  end
end
