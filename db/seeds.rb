require 'open-uri'
require 'json'
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if Rails.env.development means that this password and email will only work in development mode
LineItem.destroy_all
Product.destroy_all
# DO NOT DESTROY Category.destroy_all # if destroy, fix python script
Payment.destroy_all
Order.destroy_all
Customer.destroy_all
# DO NOT DESTROY Province.destroy_all # if destroy, populate again manually
AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

product = Product.new
customer = Customer.new
order = Order.new
# lineItems = LineItem.new
json = ActiveSupport::JSON.decode(File.read('db/bestbuy4.json'))
# puts json

json.each do |name|
  # puts name.values[1][1..-1].to_f
  product = Product.create!(name: name.values[0],
                            category_id: name.values[3].to_i,
                            manufacturer: name.values[0].split(' ').first,
                            sellPrice: name.values[1][1..-1].to_d,
                            image: name.values[2])
end

Faker::Config.locale = 'en-CA'
rand(50..100).times do
  customer = Customer.create(firstName: Faker::Name.first_name,
                             lastName: Faker::Name.last_name,
                             streetAddress: Faker::Address.street_address,
                             city: Faker::Address.city,
                             country: 'Canada',
                             postalCode: Faker::Address.postcode,
                             phone: Faker::PhoneNumber.phone_number,
                             province_id: rand(1..13).to_i)
  rand(0..3).times do
    order = Order.create(pstTimeOfPurchase: customer.province.gstTax,
                         gstTimeOfPurchase: customer.province.pstTax,
                         customer_id: customer.id.to_i)
    # order = customer.orders
    #                 .build(pstTimeOfPurchase: customer.province.gstTax,
    #                        gstTimeOfPurchase: customer.province.pstTax,
    #                        customer_id: customer.id.to_i)
    #                 .save
    # puts order.id
    p = Product.order('random()').first
    LineItem.create(quantity: rand(1..10),
                    priceTimeOfPurchase: p.sellPrice.to_d,
                    product_id: p.id.to_i,
                    order_id: order.id)
  end
end

# rand(30..50).times do
#   o = Order.order('random()').first.id
#   p = Product.order('random()').first
#   LineItem.create(quantity: rand(1..10),
#                   priceTimeOfPurchase: p.sellPrice.to_d,
#                   product_id: p.id.to_i,
#                   order_id: o.to_i)
# end

puts "Generated #{Product.count} product."
puts "Generated #{Category.count} categories."
puts "Generated #{Customer.count} customers."
puts "Generated #{Order.count} orders."
puts "Generated #{LineItem.count} lineItems."
