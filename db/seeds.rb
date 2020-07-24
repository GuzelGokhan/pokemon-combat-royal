# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
Pokemon.destroy_all

puts "Creating pokemon..."

golbat = { name:"golbat" , location: "Antwerpen" , life: 24 , attack: 14, element:"air" , user_id: 1 }
pidgeotto = { name: "pidgeotto", location: "North shore", life:46 , attack: 18, element:"air" , user_id: 1 }
scyther = { name: "scyther" , location: "Seven mille", life:41, attack: 15, element:"air" , user_id:1  }
zapdos = { name:"zapdos" , location: "Clafford" , life: 37, attack: 17, element: "air", user_id: 1 }

cubone = { name: "cubone", location: "Learie" , life: 19, attack: 12, element: "earth" , user_id:1  }
nidoking = { name: "nidoking", location: "Pescara", life: 22, attack: 10, element: "earth", user_id:1  }
nidoqueen = { name: "nidoqueen", location: "Tokyo", life: 30, attack: 17 , element:"earth" , user_id: 1}
sandslash = { name: "sandslash", location: "Dublin", life: 24, attack: 19 , element: "earth", user_id: 1 }

charizard = { name: "charizard", location: "Manthattan" , life: 37, attack: 9 , element: "fire" , user_id: 1 }
magmar = { name: "magmar" , location: "Berlin" , life: 40 , attack: 5 , element: "fire" , user_id: 1}
ninetales = { name: "ninetales", location: "Taline", life: 49 , attack: 3 , element: "fire" , user_id: 1 }
quilava = { name: "quilava", location: "Paris" , life: 34 , attack:  , element: "fire" , user_id:1 }

blastoise = { name: "blastoise", location: "Ankara", life: 13 , attack: 2 , element:"water" , user_id: 1 }
poliwag = { name: "poliwag", location: "Moskow", life: 23, attack: 4 , element:"water" , user_id: 1}
squirtle = { name: "squirtle", location: "Madrid", life: 35, attack: 8 , element:"water" , user_id: 1}
tentacruel = { name: "tentacruel", location: "Rome", life: 19, attack: 7 , element:"water" , user_id: 1 }

pokemons = [ golbat, pidgeotto, scyther, zapdos, cubone, nidoking, nidoqueen, sandslash, charizard, magmar, ninetales, quilava, blastoise, poliwag, squirtle, tentacruel]

pokemons.each do |pokemon|
  Pokemon.create!(pokemon)
end
puts "Finished!"
