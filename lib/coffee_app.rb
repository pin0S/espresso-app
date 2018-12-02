require "coffee_app/app"
require "coffee_app/drink"
require "coffee_app/order"
require "coffee_app/payment"
require "coffee_app/user"

module CoffeeApp
  def self.call(prices_json, orders_json, payments_json)
    app = App.new
    app.add_prices(prices_json)
    app.add_orders(orders_json)
    app.add_payments(payments_json)
    app.add_users
    app.result.to_json
  end
end
