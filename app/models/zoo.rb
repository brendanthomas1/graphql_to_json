class Zoo < ApplicationRecord
  has_many :animals
  has_many :employees
end
