class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sell
  has_one :address
end
