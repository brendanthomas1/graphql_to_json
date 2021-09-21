class ZooConverter < Converter::BaseConverter
  field :name,   from: [:zoo, :name]
  field :city,   from: [:zoo, :address, :city]
  field :street, from: [:zoo, :address, :address1]
  field :state,  from: [:zoo, :address, :state], required: true
end

# name it ToscheStation! For power converters!
#
#
# inherit from ToscheStation::PowerConverter
#
# which can extend the ClassMethods module
#
#
# TODO:
# - make has_many fields work
# - introduce `resolve` option to transform data
# - introduce required option
# - introduce "nested" or "object" method for nested payload fields
