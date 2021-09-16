module Types
  class AddressType < Types::BaseObject
    field :address_1, String, null: false
    field :city, String, null: false
    field :state, String, null: false
    field :zip_code, String, null: false
  end
end
