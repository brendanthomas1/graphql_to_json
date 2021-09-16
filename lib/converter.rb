module Converter
  def field(name, from:)
    fields << { name: name, from: from }
    add_to_froms(from)
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
end
