module Converter
  class DataResolver
    def self.data_for(search_field, arg, fields, type: :zoo)
      new(search_field, arg, fields, type).data
    end

    attr_reader :search_field, :arg, :fields, :type

    def initialize(search_field, arg, fields, type)
      @search_field = search_field
      @arg = arg
      @fields = fields
      @type = type
    end

    def data
      return {} if fields.empty?

      GraphqlToJsonSchema.execute(graphql_query)
    end

    def graphql_query
      QueryBuilder.build(type, search_field, arg, fields: fields)
    end
  end
end
