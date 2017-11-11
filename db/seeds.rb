# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'beers'
require 'byebug'

puts "creating some beers"
beers.each do |beer|
  if beer[:PRODUCT_SUB_CLASS_NAME] == "BEER"
    Beer.create(
      name: beer[:PRODUCT_LONG_NAME],
      alcohol_percent: beer[:PRODUCT_ALCOHOL_PERCENT].to_f,
      country: beer[:PRODUCT_COUNTRY_ORIGIN_NAME]
    )
  end
end
puts "finished"
# beers.each do |beer|
#   if beer[:PRODUCT_SUB_CLASS_NAME] == "BEER"
#     p beer[:PRODUCT_LONG_NAME]
#     p beer[:PRODUCT_ALCOHOL_PERCENT].to_f
#     p beer[:PRODUCT_COUNTRY_ORIGIN_NAME]
#   end
# end