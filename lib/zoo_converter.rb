class ZooConverter
  extend Converter

  field :name, from: [:zoo, :name]

  def to_json
    payload = {}
    self.class.fields.map do |f|
      payload[f[:name]] = resolve_data[:data].dig(*f[:from])
    end
    payload.to_json
  end

  def resolve_data
    @resolve_data = Converter::DataResolver.data_for(:id, 1, self.class.froms).with_indifferent_access
  end
end
