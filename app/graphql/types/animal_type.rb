module Types
  class AnimalType < Types::BaseObject
    description 'an animal'

    field :name, String, null: false
    field :gender, String, null: false
    field :age, Integer, null: false
    field :type, String, null: false
    field :weight, Integer, null: false
  end
end
