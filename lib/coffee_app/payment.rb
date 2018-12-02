module CoffeeApp
  class Payment
    attr_reader :user, :amount

    def initialize(user:, amount:)
      @user = user
      @amount = amount
    end
  end
end
