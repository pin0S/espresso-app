require 'json'

task :default => [:run]

desc "load the prices, order, payments, and execute it all!"
task "run" do
  $LOAD_PATH.unshift(File.dirname(__FILE__), "lib")
  require 'coffee_app'
  
  # load the data files into strings for you
  prices_json = File.read("data/prices.json")
  orders_json = File.read("data/orders.json")
  payments_json = File.read("data/payments.json")
  
  # call the app, passing the data as strings containing JSON
  result_json = CoffeeApp.call(prices_json, orders_json, payments_json)
  
  # turn the JSON back into a Ruby structure
  user_balances = JSON.load(result_json)
  
  # pretty print the output
  puts "Total:"
  puts sprintf("%-10s%-11s%-11s%-11s", "user", "orders", "payments", "balance")
  puts sprintf("--------")
  user_balances.each do |user_balance|
    puts sprintf("%-10s$%-10.2f$%-10.2f$%-10.2f", user_balance["user"], user_balance["order_total"], user_balance["payment_total"], user_balance["balance"])
  end
end
