# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Users = User.create(
        username: "zainal",
        email:    "zainal@41studio.com",
        password: "password",
        admin:    false        
      ),
      User.create(
        username: "admin",
        email:    "admin@mail.com",
        password: "password",
        admin:    true        
      )

Users.each do |user|
  user.confirm
end