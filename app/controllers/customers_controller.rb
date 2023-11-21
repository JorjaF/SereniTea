class CustomersController < ApplicationController
  before_action :set_customer, only: [:subscriptions, :cancel_subscription]

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end
end
