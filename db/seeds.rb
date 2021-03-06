require 'faker'
# require 'open-uri'
# require 'nokogiri'

puts "cleaning started"
User.destroy_all
Profile.destroy_all
Invoice.destroy_all
Admin.destroy_all
puts "cleaning finished"
sections = []
puts "start creating sections"

section1 = Section.create(
  name: "Baladin", start_age: 6,
  end_age: 8)
sections << section1
section2 = Section.create(
  name: "Louveteau", start_age: 6,
  end_age: 8)
sections << section2
section3 = Section.create(
  name: "Eclaireur", start_age: 6,
  end_age: 8)
sections << section3
section4 = Section.create(
  name: "Pionnier", start_age: 6,
  end_age: 8)
sections << section4
section5 = Section.create(
  name: "Guide", start_age: 6,
  end_age: 8)
sections << section5
section6 = Section.create(
  name: "Lutin", start_age: 6,
  end_age: 8)
sections << section6
section7 = Section.create(
  name: "Horizon", start_age: 6,
  end_age: 8)
sections << section7
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
  gender: "Male",
  comment: "No comments needed",
  user_id: user.id,
  section_id: section5.id,
  photo_url: 'https://res.cloudinary.com/dwuowqi7r/image/upload/v1511373312/nqymhzsew3sykxhwywhr.jpg',
  status: "Accepted"
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
  gender: "Male",
  comment: "Allergic to chicken",
  user_id: user.id,
  section_id: section4.id,
  status: "Accepted",
  photo_url: "https://res.cloudinary.com/dwuowqi7r/image/upload/v1510330827/rmrwwvvqfzoczs1vlxql.jpg"
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
  gender: "Female",
  comment: "No comments needed",
  user_id: user.id,
  section_id: section1.id,
  status: "Accepted",
  photo_url: "https://res.cloudinary.com/dwuowqi7r/image/upload/v1511380318/qkmivxcvf1x0fvydjtcl.jpg"
  )
admin = Admin.create(
  profile_id: user.id
  )

# user n°4 who is an admin
user = User.create(
  email: "yasser1911@hotmail.com",
  password: "password")
profile = Profile.create(
  first_name: "Yasser",
  last_name: "Barona",
  totem: "Narval",
  birth_date: "Sept 23 1991",
  address: "Jules Van Praet 23",
  zip_code: "1000",
  city: "Brussels",
  country: "Belgium",
  phone_number: "0493169067",
  gender: "Male",
  comment: "No comments needed",
  user_id: user.id,
  section_id: section2.id,
  status: "Accepted",
  photo_url: "https://res.cloudinary.com/dwuowqi7r/image/upload/v1511433404/yass_vgmphi.jpg"
  )
admin = Admin.create(
  profile_id: user.id
  )

puts "Finished seeding admin profiles"

# faker

puts 'Creating user db through FAKER...'
30.times do (
  user = User.create(
    email: Faker::Internet.email,
    password: "password"
    )
  pokemon = Faker::Pokemon.name
  profile = Profile.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    totem: pokemon,
    birth_date: Faker::Date.birthday(18, 65),
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_number: Faker::PhoneNumber.phone_number,
    # photo: get_pokemon_image(pokemon.downcase).first,
    gender: "Male",
    comment: "No comments needed",
    user_id: user.id,
    section_id: sections.sample.id
    )

  3.times do(
    child = Child.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthday: Faker::Date.birthday(18, 65),
      section_id: sections.sample.id,
      profile_id: profile.id
      )
      )
  end

#  invoice = Invoice.create(
#    admin_id: 1,
#    profile_id: profile.id,
#    date: "30.09.2017",
#    amount: 150,
#    title: "2017 - Cotisation début d'année",
#    bank_account: "BE50 5000 5000 5000",
#    due_date: "31.01.2017",
#  )
)
end

puts 'Finished seeding user db!'
