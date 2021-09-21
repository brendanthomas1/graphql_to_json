module Converter
  class BaseConverter
    extend ClassMethods

    def initialize(arg_id)
      @arg_id = arg_id
    end

    def to_json
      payload = {}
      self.class.fields.map do |f|
        resolved_field = resolve_data[:data].dig(*camelized_keys(f[:from]))

        raise MissingField, "#{f[:name]} can't be nil!" if f[:required] && resolved_field.nil?

        payload[f[:name]] = resolved_field
      end
      payload.to_json
    end

    def resolve_data
      @resolve_data ||=
        Converter::DataResolver.data_for(:id, @arg_id, self.class.maybe).with_indifferent_access
    end

    private

    def camelized_keys(from)
      from.map { |field_name| field_name.to_s.camelize(:lower).to_sym }
    end
  end

  class MissingField < StandardError; end
end
