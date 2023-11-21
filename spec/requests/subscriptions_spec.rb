require "rails_helper"

RSpec.describe "Subscriptions API", type: :request do
  describe "POST /subscriptions" do
    let(:customer) { create(:customer) }
    let(:tea) { create(:tea) }

    it "subscribes a customer to a tea subscription" do
      subscription_params = {
        title: "Monthly Subscription",
        price: "19.99",
        status: "active",
        frequency: "monthly"
      }

      post "/customers/#{customer.id}/subscriptions", params: { subscription: subscription_params, tea_id: tea.id }

      expect(response).to have_http_status(:created)

      body = JSON.parse(response.body)
      expect(body["title"]).to eq("Monthly Subscription")
      expect(body["price"]).to eq("19.99")
      expect(body["status"]).to eq("active")
      expect(body["frequency"]).to eq("monthly")
      expect(body["customer_id"]).to eq(customer.id)
      expect(body["tea_id"]).to eq(tea.id)
    end

    it "returns an error for invalid subscription parameters" do
      invalid_subscription_params = {
        title: "", 
        price: "",
        status: "",
        frequency: ""
      }

      post "/customers/#{customer.id}/subscriptions", params: { subscription: invalid_subscription_params, tea_id: tea.id }

      expect(response).to have_http_status(:unprocessable_entity)


      body = JSON.parse(response.body)
      expect(body).to have_key("errors")
      expect(body["errors"]).to include("Title can't be blank")
      expect(body["errors"]).to include("Frequency can't be blank")
      expect(body["errors"]).to include("Status can't be blank")
      expect(body["errors"]).to include("Price can't be blank")
    end
  end

  describe "DELETE /subscriptions/:id" do
    let(:customer) { create(:customer) }
    let(:subscription) { create(:subscription, customer: customer) }

    it "cancels a customer's tea subscription" do
      delete "/customers/#{customer.id}/subscriptions/#{subscription.id}"

      expect(response).to have_http_status(:ok)


      subscription.reload
      expect(subscription.status).to eq("cancelled")
    end

    it "returns a 404 status if subscription is not found" do
      non_existent_subscription_id = 9999999999999
      delete "/customers/#{customer.id}/subscriptions/#{non_existent_subscription_id}"

      expect(response).to have_http_status(:not_found)
    end
  end
end
