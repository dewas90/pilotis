require 'faker'

puts "cleaning started"
User.destroy_all
Profile.destroy_all
Invoice.destroy_all
Admin.destroy_all
puts "cleaning finished"


puts "Start seeding first profile"

# user n°1 who is an admin
user = User.create(
  email: "reginalddewasseige@gmail.com",
  password: "password"
  )

profile = Profile.create(
  first_name: "Reginald",
  last_name: "de Wasseige",
  totem: "Civette",
  birth_date: "Nov, 18 1990",
  address: "Avenue de l'Emeraude, 65",
  zip_code: "1030",
  city: "Brussels",
  country: "Belgium",
  phone_number: "0476322388",
  photo: '',
  gender: "Male",
  comment: "No comments needed",
  user_id: user.id
  )

admin = Admin.create(
  profile_id: user.id
  )

# user n°2 who is an admin
user = User.create(
  email: "heinendiogo@gmail.com",
  password: "password")
profile = Profile.create(
  first_name: "Diogo",
  last_name: "Heinen",
  totem: "Indri",
  birth_date: "July 10 1995",
  address: "21 Rue Liedts",
  zip_code: "1030",
  city: "Brussels",
  country: "Belgium",
  phone_number: "0477985918",
  photo: '',
  gender: "Male",
  comment: "Allergic to chicken",
  user_id: user.id
  )
admin = Admin.create(
  profile_id: user.id
  )

# user n°3 who is an admin
user = User.create(
  email: "carmenlongo@hotmail.com",
  password: "password")
profile = Profile.create(
  first_name: "Carmen",
  last_name: "Longo",
  totem: "Miriki",
  birth_date: "Dec 19 1993",
  address: "Av Nestor Plissart 98",
  zip_code: "1150",
  city: "Brussels",
  country: "Belgium",
  phone_number: "0497485083",
  photo: '',
  gender: "Female",
  comment: "No comments needed",
  user_id: user.id
  )
admin = Admin.create(
  profile_id: user.id
  )

puts "Finished seeding admin profiles"

# faker

puts 'Creating user db through FAKER...'
10.times do (
  user = User.create(
    email: Faker::Internet.email,
    password: "password"
    )
  profile = Profile.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    totem: Faker::Pokemon.name,
    birth_date: Faker::Date.birthday(18, 65),
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_number: Faker::PhoneNumber.phone_number,
    photo: '',
    gender: "Male",
    comment: "No comments needed",
    user_id: user.id
    )
  )
end
puts 'Finished seeding user db!'

