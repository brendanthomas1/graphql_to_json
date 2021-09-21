module Converter
  module ClassMethods
    def field(name, from:, required: false)
      fields << { name: name, from: from, required: required }
      thing << from
      add_to_froms(from)
    end

    def thing
      @thing ||= []
    end

    def fields
      @fields ||= []
    end

    def froms
      @froms ||= {}
    end

    def add_to_froms(array)
      array = array.dup
      key = array.delete_at(0)
      froms[key] ||= []
      froms[key] << array.first if array.one?
      froms[key] << { array.first => array.last } if array.length == 2
    end

    def array_to_nested_hash(array)
      array.reverse.inject { |val, key| { key => [val] } }
    end

    def foo
      thing.map { |f| array_to_nested_hash f }
    end

    def maybe
      foo.inject({}) do |hash, field|
        hash.merge(field) { |_key, old_value, new_value| old_value + new_value }
      end
    end
  end
end
