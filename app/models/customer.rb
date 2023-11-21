class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :teas, through: :subscriptions

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address 
  validates_presence_of :email, case_sensitive: false
  validates_uniqueness_of :email

end
