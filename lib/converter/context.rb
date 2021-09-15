module Converter
  class Context
    def initialize
      @names = []
    end
    
    attr_reader :names

    def field(name)
      names << name
    end
  end
end

