module Types
  class ZooType < Types::BaseObject
    description 'a zoo'

    field :name, String, null: false
    field :address, AddressType, null: true
    field :animals, [AnimalType], null: false
    field :employees, [EmployeeType], null: false
  end
end
