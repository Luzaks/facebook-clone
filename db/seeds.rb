User.create!(name:  "Foo",
             lastname: "Bar",
             email: "foo@bar.com",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Melissa",
             lastname: "Castorena",
             email: "mcastorena0316@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

User.create!(name:  "Lu",
             lastname: "Rangel",
             email: "kanemekanik@gmail.com",
             password:              "123456",
             password_confirmation: "123456")



30.times do |n|
  name  = Faker::Name.name
  lastname = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               lastname: lastname,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end


