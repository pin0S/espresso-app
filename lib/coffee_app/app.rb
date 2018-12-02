require "json"

module CoffeeApp
  class App
    attr_reader :prices, :orders, :payments, :users

    def initialize
      @prices = []
      @orders = []
      @payments = []
      @users = []
    end

    def add_prices(prices_json)
      @prices = JSON.parse(prices_json, symbolize_names: true).map do |drink|
        Drink.new(**drink)
      end
    end

    def add_orders(orders_json)
      @orders = JSON.parse(orders_json, symbolize_names: true).map do |order|
        Order.new(**order, amount: find_drink(order[:drink]).price(order[:size].to_sym))
      end
    end

    def add_payments(payments_json)
      @payments = JSON.parse(payments_json, symbolize_names: true).map do |payment|
        Payment.new(**payment)
      end
    end

    def add_users
      @users = (orders + payments).map(&:user).uniq.map do |user|
        User.new(name: user)
      end
    end

    def find_drink(drink_name)
      prices.find { |drink| drink.drink_name == drink_name }
    end
  end
end
