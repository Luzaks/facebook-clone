User.create!(name:  "Foo",
             lastname: "Bar",
             email: "foo@bar.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
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
