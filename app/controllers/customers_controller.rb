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

  # # POST /customers/:id/subscribe
  # def subscribe
  #   @customer = Customer.find(params[:id])
  #   @subscription = @customer.subscriptions.build(subscription_params)

  #   if @subscription.save
  #     render json: @subscription, status: :created
  #   else
  #     render json: { errors: @subscription.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /customers/:id/cancel_subscription
  # def cancel_subscription
  #   @subscription = @customer.subscriptions.find(params[:subscription_id])
  #   @subscription.update(status: 'cancelled')

  #   head :no_content
  # end

  # # GET /customers/:id/subscriptions
  # def subscriptions
  #   @subscriptions = @customer.subscriptions
  #   render json: @subscriptions
  # end

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
