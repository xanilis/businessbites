puts "destroying all entries... :("
Review.destroy_all
Restaurant.destroy_all
Favorite.destroy_all
User.destroy_all

puts "DB emptied! :)"

puts "Seeding 10 random users.."

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8),
  )
  puts "Created user #{User.count}"
end

puts "Seeding 10 random favorite restaurant lists.."

10.times do
  Favorite.create!(
    title: Faker::Coffee.blend_name,
    status: false,
    user: User.all.sample
  )
  puts "Created favorite list #{Favorite.count}"
end

puts "Seeding Belcanto"

Restaurant.create!(
  name: "Belcanto",
  address: "R. Serpa Pinto 10A",
  description: "At Belcanto, José Avillez offers a unique gastronomic and sensory journey
                —contemporary Portuguese cuisine
                in a sophisticated setting that takes us on a journey in time,
                from Chiado’s old romantic past to the future.

                With two Michelin stars and currently #42 on “The World’s 50 Best Restaurants List”,
                Belcanto is located at Lisbon’s historic centre, offers an attentive,
                welcoming and discreet service, and an extraordinary wine selection
                that showcases some of the best Portuguese wines
                as well as other celebrated international references.",
  photo: "belcanto1.jpg, belcanto2.jpg, belcanto3.jpg, belcanto4.jpg, belcanto5.jpg",
  food_style: "Portuguese".capitalize,
  atmosphere: "exclusive".capitalize,
  area: "chiado".capitalize,
  food_philosophy: "haute-cuisine".titleize,
  extras: "extensive wine list".titleize,
  user_rating: 5,
  favorite_id: Favorite.all.sample.id,
)

puts "Belcanto created."


puts "Seeding 10 random restaurants"

10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: Faker::Restaurant.description,
    photo: "", 
    food_style: ["Japanese","Fusion","Latin","Portuguese","Spanish","French","Italian"].sample.capitalize,
    atmosphere: ["Calm","Formal","Casual","Quiet","Upscale","luxurious","exclusive","romantic"].sample.capitalize,
    area: ["chiado","bairro alto","alfama","cascais","oeiras","carcavelos","belém","baixa","rossio","Alcântara","Príncipe Real","Parque das Nações"].sample.capitalize,
    food_philosophy: ["vegan","vegetarian","seafood","traditional","modern","fusion","local","experimential","haute-cuisine"].sample.capitalize,
    extras: ["extensive wine list","amuse-bouche","live music"].sample.capitalize,
    user_rating: rand(1..5),
    favorite_id: Favorite.all.sample.id
  )
  puts "Created restaurant #{Restaurant.count} "
end


puts "Seeding 10 random reviews.."

10.times do
  Review.create!(
   description: Faker::Restaurant.review,
   title: Faker::Hipster.sentence,
   rating: rand(1..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )
  puts "Created review #{Review.count}"
end


puts "Seeding completed. Well done."
