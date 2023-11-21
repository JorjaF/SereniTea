require "rails_helper"

RSpec.describe "Customers API", type: :request do
  describe "POST /customers" do
    it "creates a new customer" do
      customer_params = {
        first_name: "John",
        last_name: "Doe",
        email: "john.doe@example.com",
        address: "123 Main St, Cityville, CA 12345"
      }

      post "/customers", params: { customer: customer_params }.to_json, headers: { "Content-Type": "application/json" }

      expect(response).to have_http_status(:created)
      
      json_response = JSON.parse(response.body)

      body = JSON.parse(response.body)
      expect(body["first_name"]).to eq("John")
      expect(body["last_name"]).to eq("Doe")
      expect(body["email"]).to eq("john.doe@example.com")
      expect(body["address"]).to eq("123 Main St, Cityville, CA 12345")
    end

    it "returns unprocessable entity for invalid data" do
      customer_params = {
        first_name: "",
        last_name: "",
        email: "",
        address: ""
      }
      
      post "/customers", params: { customer: customer_params }.to_json, headers: { "Content-Type": "application/json" }

      expect(response).to have_http_status(:unprocessable_entity)

      body = JSON.parse(response.body)
      expect(body["errors"]).to include("First name can't be blank")
      expect(body["errors"]).to include("Last name can't be blank")
      expect(body["errors"]).to include("Email can't be blank")
      expect(body["errors"]).to include("Address can't be blank")      
    end
  end

  describe "GET /customers/:id/subscriptions" do
    it "returns all subscriptions for a customer" do
      customer = create(:customer)
      subscriptions = create_list(:subscription, 3, customer: customer)

      get "/customers/#{customer.id}/subscriptions"

      expect(response).to have_http_status(:ok)
      
      body = JSON.parse(response.body)
      expect(body).to be_an(Array)
      expect(body.size).to eq(3)
      expect(body[0]["customer_id"]).to eq(customer.id)
      expect(body[1]["customer_id"]).to eq(customer.id)
      expect(body[0]["title"]).to eq(subscriptions[0].title)
      expect(body[0]["price"]).to eq(subscriptions[0].price.to_s)
      expect(body[0]["status"]).to eq(subscriptions[0].status)
      expect(body[0]["frequency"]).to eq(subscriptions[0].frequency)
    end
  end
end
