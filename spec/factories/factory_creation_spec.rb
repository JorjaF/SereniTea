require 'rails_helper'

RSpec.describe 'Factories' do
  it 'creates a valid customer' do
    customer = FactoryBot.create(:customer)
    expect(customer).to be_valid
  end

  it 'creates a valid subscription' do
    customer = FactoryBot.create(:customer)
    tea = FactoryBot.create(:tea)
    subscription = FactoryBot.create(:subscription)
    expect(subscription).to be_valid
  end

  it 'creates a valid tea' do
    tea = FactoryBot.create(:tea)
    expect(tea).to be_valid
  end
end
