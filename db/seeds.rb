# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'net/http'

Province.destroy_all
User.destroy_all
AdminUser.destroy_all
Category.destroy_all
Item.destroy_all

items = JSON.parse(open('https://pastebin.com/raw/v6bwPYuD').read)

items['itemdata'].each do |_items, data|
  Category.create(
    category_name: data['qual']
  )
end

Province.create(
  name: 'Manitoba'
)

Province.create(
  name: 'British Columbia'
)

items['itemdata'].each do |_items, data|
  c = Category.find_by(category_name: data['qual'])
  i = Item.create(
    name: data['dname'],
    cost: data['cost'],
    category: c,
    image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/items/#{data['img']}",
    lore: data['lore'],
    onSale: rand < 0.5,
    quantity: 20
  )
end

puts "Generated #{Item.count} items."
puts "Generated #{Category.count} categorys."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
