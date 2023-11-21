class SubscriptionsController < ApplicationController
  def index
    @subscriptions = if params[:customer_id]
      Customer.find(params[:customer_id]).subscriptions
    else
      Subscription.all
    end
    render json: @subscriptions
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.customer_id = params[:customer_id]
    @subscription.tea_id = params[:tea_id]

    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: { errors: @subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.status = "cancelled"
  
    if subscription.save
      render json: { status: :ok, message: "Subscription successfully cancelled" }
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Subscription not found" }, status: :not_found
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
