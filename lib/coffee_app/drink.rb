module CoffeeApp
  class Drink
    attr_reader :drink_name, :prices

    def initialize(drink_name:, prices:)
      @drink_name = drink_name
      @prices = prices
    end

    def price(size)
      prices.fetch(size, 0)
    end
  end
end
