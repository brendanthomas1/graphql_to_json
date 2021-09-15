class Animal < ApplicationRecord
  belongs_to :zoo
  belongs_to :animal_type

  def type
    animal_type.name
  end
end
