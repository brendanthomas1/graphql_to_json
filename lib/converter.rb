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
    froms[array.first] ||= []
    froms[array.first] << array.last
  end
end
