require 'json'
file = File.read("db/try.json")
restaurants = JSON.parse(file)

puts "destroying all entries... :("
Review.destroy_all
Favorite.destroy_all
Restaurant.destroy_all
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
  photo: "localbelcanto1.jpg, localbelcanto2.jpg, localbelcanto3.jpg, localbelcanto4.jpg, localbelcanto5.jpg",
  food_style_list: "Portuguese".capitalize,
  atmosphere_list: "luxurious".capitalize,
  area_list: "chiado".capitalize,
  food_philosophy_list: "haute-cuisine".titleize,
  extra_list: "extensive wine list".titleize,
  suitable_for_list: "One2One".capitalize,
  user_rating: 5
)

puts "Belcanto created."

puts "Seeding EPUR"

Restaurant.create!(
  name: "EPUR",
  address: "Largo da Academia Nacional de Belas Artes 14",
  description: "There’s a heaven inside each body, hidden in every palate. In it there is a universe waiting to be dazzled by unknown ‘ingre-details’.",
  photo: "localepur1.jpg, localepur2.jpg, localepur3.jpg, localepur4.jpg, localepur5.jpg",
  food_style_list: "fusion".capitalize,
  atmosphere_list: "luxurious".capitalize,
  area_list: "alfama".capitalize,
  food_philosophy_list: "haute-cuisine".titleize,
  extra_list: "extensive wine list".titleize,
  suitable_for_list: "One2One".capitalize,
  user_rating: 5,
)

puts "EPUR created."


puts "Seeding real restaurants"
restaurants.each do |restaurant|
  Restaurant.create!(
    name: restaurant["name"],
    address: restaurant["location"]["display_address"].join(" "),
    description: Faker::Restaurant.description,
    photo: restaurant["image_url"],
    food_style_list: ["Japanese","Fusion","Latin","Portuguese","Spanish","French","Italian"].sample.capitalize,
    atmosphere_list: ["Calm","Formal","Casual","Luxurious"].sample.capitalize,
    area_list: ["chiado","bairro alto","alfama","cascais","oeiras","carcavelos","belém","baixa","rossio","Alcântara","Príncipe Real","Parque das Nações"].sample.capitalize,
    food_philosophy_list: ["vegan","vegetarian","seafood","traditional","modern","local","experimential","haute-cuisine"].sample.capitalize,
    extra_list: ["extensive wine list","amuse-bouche","live music"].sample.capitalize,
    suitable_for_list: ["One2One","Small Groups","Big Groups"].sample.capitalize,
    user_rating: rand(2..5),
    link: restaurant["url"]
  )
  puts "Created restaurant #{Restaurant.count} "
end


puts "Seeding 10 random favorite restaurant lists.."
10.times do
  Favorite.create!(
    title: Faker::Coffee.blend_name,
    status: false,
    user: User.all.sample,
    restaurant: Restaurant.all.sample,
  )
  puts "Created favorite list #{Favorite.count}"
end


puts "Seeding 10 random reviews.."

100.times do
  Review.create!(
   description: Faker::Restaurant.review,
   title: Faker::Hipster.sentence,
   rating: rand(1..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )
  puts "Created review #{Review.count}"
end

puts "Seeding real looking Reviews for EPUR"

  Review.create!(
   description: Faker::Restaurant.review,
   title: "Amazing food in a well-crafted atmosphere",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

    Review.create!(
   description: Faker::Restaurant.review,
   title: "Clients loved it",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

      Review.create!(
   description: Faker::Restaurant.review,
   title: "The Pork Belly is out of this world",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

        Review.create!(
   description: Faker::Restaurant.review,
   title: "Amazing Christmas Company event with incredible food",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

  puts "Done"

  puts "Seeding real looking Reviews for Belcanto"

  Review.create!(
   description: Faker::Restaurant.review,
   title: "Slick, elegant, luxurious",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

    Review.create!(
   description: Faker::Restaurant.review,
   title: "I got promoted here - yay!",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

    Review.create!(
   description: Faker::Restaurant.review,
   title: "Gorgeous food presentation, amazing wine",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )

    Review.create!(
   description: Faker::Restaurant.review,
   title: "Amazing food in a well-crafted atmosphere",
   rating: rand(4..5),
   restaurant: Restaurant.all.sample,
   user: User.all.sample
  )


puts "Seeding completed. Well done."
