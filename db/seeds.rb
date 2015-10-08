# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.where(email: 'superadmin@ncsu.edu').blank?
    User.create!(name: 'SuperAdmin', email: 'superadmin@ncsu.edu', password:'123456',password_confirmation:'123456',usertype: 1, admin: true, check: 0 )
  end