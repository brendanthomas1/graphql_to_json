class ZooConverter
  extend Converter

  field :name,   from: [:zoo, :name]
  field :city,   from: [:zoo, :address, :city]
  field :street, from: [:zoo, :address, :address1]
  field :state,  from: [:zoo, :address, :state]

  def to_json
    payload = {}
    self.class.fields.map do |f|
      payload[f[:name]] = resolve_data[:data].dig(*f[:from])
    end
    payload.to_json
  end

  def resolve_data
    @resolve_data ||=
      Converter::DataResolver.data_for(:id, @zoo_id, self.class.maybe).with_indifferent_access
  end

  def initialize(zoo_id)
    @zoo_id = zoo_id
  end
end

# name it ToscheStation! For power converters!
#
#
# inherit from ToscheStation::PowerConverter
#
# which can extend the ClassMethods module
