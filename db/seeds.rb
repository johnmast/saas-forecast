# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


p1 = Stripe::Plan.retrieve("free-plan")
p2 = Stripe::Plan.retrieve("basic-plan")
p3 = Stripe::Plan.retrieve("premium-plan")

Plan.create(:stripe_id => p1.id, :name => p1.name, :price => p1.amount, :interval => p1.interval)
Plan.create(:stripe_id => p2.id, :name => p2.name, :price => p2.amount, :interval => p2.interval)
Plan.create(:stripe_id => p3.id, :name => p3.name, :price => p3.amount, :interval => p3.interval)