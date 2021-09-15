module Converter
  class QueryBuilder
    def self.build(query_type, arg_type, arg_values, fields:)
      new(query_type, arg_type, arg_values, fields).build
    end

    attr_reader :query_type, :arg_type, :arg_values, :fields

    def initialize(query_type, arg_type, arg_values, fields)
      @query_type = query_type
      @arg_type = arg_type
      @arg_values = arg_values
      @fields = fields
    end

    def build
      query_wrapper do
        fields[query_type].map { |field| query_string(field) }.join(' ')
      end
    end

    def query_wrapper
      " { #{query_type}(#{arg_type}: #{argument_value}) { #{yield} } } "
    end

    def argument_value
      return "\"#{arg_values}\"" unless arg_values.is_a?(Array)

      arg_values.inspect
    end

    def query_string(values)
      if values.is_a?(Hash)
        values.map { |key, value| query_row(key, value) }
      else
        values.to_s.camelize(:lower)
      end
    end

    def query_row(key, values)
      "#{key.to_s.camelize(:lower)} { #{format(values)} }"
    end

    def format(value)
      return value.to_s.camelize(:lower) if value.is_a? Symbol

      if value.is_a? Hash
        value.map { |key, vals| query_row(key, vals) }.join(' ')
      else
        value.map { |v| format(v) }.join(' ')
      end
    end
  end
end
