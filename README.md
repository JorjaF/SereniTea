# SereniTea README

This is my take home challenge for a tea subscription service, that I named SereniTea. It is an API project that does the backend functions for the application. It has a total of 4 endpoints and represents the Minium Viable Product for the challenge, and as such it does not have any "bells or whistles"

## Tech stack and Configuration

### Ruby version 3.2.2

### Rails version 7.0.8

### Gems
- "pg", "~> 1.1"
- gem "puma", "~> 5.0"
- gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


### Configuration
- Rails db:create
- Rails db:migrate
- Bundle Install

### How to run the test suite
- bundle exec rspec

### API Endpoints
- post "/customers" to create customers. Should return a 200
```
{
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@example.com",
        "address": "123 Main St, Cityville, CA 12345"
}
```
- "GET /customers/:id/subscriptions" to get a list of a customer subscriptions. Should return a 200
```
[
    {
        "id": 1,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:03:38.036Z",
        "updated_at": "2023-11-23T20:03:38.036Z",
        "customer_id": 2,
        "tea_id": 1
    },
    {
        "id": 2,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:13:36.889Z",
        "updated_at": "2023-11-23T20:13:36.889Z",
        "customer_id": 2,
        "tea_id": 2
    },
    {
        "id": 3,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:15:03.322Z",
        "updated_at": "2023-11-23T20:15:03.322Z",
        "customer_id": 2,
        "tea_id": 2
    }
]
```
- POST "/customers/#{customer.id}/subscriptions", to add a subscription to a customer. Should return a 200
```
{
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "tea_id": "1"
}
```
-  delete "/customers/#{customer.id}/subscriptions/#{subscription.id}", to cancel a subscription. Should return a 200
```
{
    "status": "ok",
    "message": "Subscription successfully cancelled"
}
```
view with subscrption cancelled 
```
[
    {
        "id": 1,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:03:38.036Z",
        "updated_at": "2023-11-23T20:03:38.036Z",
        "customer_id": 2,
        "tea_id": 1
    },
    {
        "id": 2,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "active",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:13:36.889Z",
        "updated_at": "2023-11-23T20:13:36.889Z",
        "customer_id": 2,
        "tea_id": 2
    },
    {
        "id": 3,
        "title": "Monthly Subscription",
        "price": "19.99",
        "status": "cancelled",
        "frequency": "monthly",
        "created_at": "2023-11-23T20:15:03.322Z",
        "updated_at": "2023-11-23T20:18:27.717Z",
        "customer_id": 2,
        "tea_id": 2
    }
]
```
### Contributer
- [Jorja Fleming](https://github.com/JorjaF)
