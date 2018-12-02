module CoffeeApp
  class Order
    attr_reader :user, :drink, :size, :amount

    def initialize(user:, drink:, size:, amount:)
      @user = user
      @drink = drink
      @size = size
      @amount = amount
    end
  end
end
