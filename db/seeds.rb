require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end

20.times do 
	User.create(
		name: Faker::Name.first_name
		email: Faker::Internet.email
		password: Faker::Lorem.words(1)
		)
end