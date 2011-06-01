# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP EXAMPLE USERS'
user1 = User.create! :name => 'Foo First User', :account_name => "foo", :email => 'user1@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user1.name
user2 = User.create! :name => 'Bar First User', :account_name => "bar", :email => 'user2@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name

# The rule I put in where once and account is created, invitable must be used to add other users. User 3 and 4 will cause an error on db:seed
# skipping all filters with save(false) and setting required information
user3 = User.new ({:name => 'Foo Second User', :account_name => "foo", :email => 'user3@test.com', :password => 'please',
 :password_confirmation => 'please', :account_id => 1, :roles => "inviter"})
user3.save(false)
puts 'New user created: ' << user3.name
user4 = User.new ({:name => 'Bar Second User', :account_name => "bar", :email => 'user4@test.com', :password => 'please',
 :password_confirmation => 'please', :account_id => 2})
user4.save(false)
puts 'New user created: ' << user4.name

# accounts creation removed because they are created automaticaly by user signup left only the display
