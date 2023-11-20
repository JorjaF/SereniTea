FactoryBot.define do
  factory :subscription do
    title { Faker::Ancient.god }
    price { Faker::Number.decimal(l_digits: 2) }
    status { %w[active inactive].sample }
    frequency { %w[daily weekly monthly].sample }

    association :customer, factory: :customer
    association :tea, factory: :tea
  end
end
