module CoffeeApp
  class User
    attr_reader :name

    def initialize(name:)
      @name = name
    end
  end
end
