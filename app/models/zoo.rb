class Zoo < ApplicationRecord
  has_many :animals
  has_many :employees
  belongs_to :address
end
