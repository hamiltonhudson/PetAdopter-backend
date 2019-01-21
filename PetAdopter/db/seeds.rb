# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DatabaseCleaner.clean_with(:truncation)

Pet.destroy_all
User.destroy_all
Match.destroy_all

# Stray from the Heart Shelter data
sfth = RestClient.get('http://api.petfinder.com/shelter.getPets?key=c921a8246aa31a0a166e869b44b40f64&id=NY245&count=100&format=json')
parsed_data_sfth = JSON.parse(sfth)

parsed_data_sfth["petfinder"]["pets"]["pet"].each do |pet|
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
    photo = pet["media"]["photos"]["photo"].find { |photo| photo["@size"]=="x"}["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"],photo:photo)
end

#Bideawee Shelter data
bideawee = RestClient.get('http://api.petfinder.com/shelter.getPets?key=c921a8246aa31a0a166e869b44b40f64&id=NY479&count=100&count=100&format=json')
parsed_data_bideawee = JSON.parse(bideawee)

parsed_data_bideawee["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]

  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end

    photo = pet["media"]["photos"]["photo"].find { |photo| photo["@size"]=="x"}["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"],photo:photo)
end

# Animal care Center of NYC data
animalCC = RestClient.get('http://api.petfinder.com/shelter.getPets?key=c921a8246aa31a0a166e869b44b40f64&id=NY12&count=100&count=100&format=json')
parsed_data_animalCC = JSON.parse(animalCC)

parsed_data_animalCC["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
    photo = pet["media"]["photos"]["photo"].find { |photo| photo["@size"]=="x"}["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"],photo:photo)
end

User.create!(name: "Gabby", email: "gbellini90@gmail.com" )
User.create(name: "Hamilton", email: "hambam@email.com")
#   Character.create(name: 'Luke', movie: movies.first)
