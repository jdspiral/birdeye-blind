class Company < ActiveRecord::Base
  has_many :customers
  has_secure_password

  validates :password, length: { minimum: 8 }, allow_nil: false

end
