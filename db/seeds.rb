# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DatabaseCleaner.clean_with(:truncation)

require 'dotenv'

API_KEY = ENV['API_KEY']

# Pet.destroy_all
# User.destroy_all
# Match.destroy_all

DatabaseCleaner.clean_with(:truncation)


#Bideawee Shelter data
bideawee = RestClient.get("http://api.petfinder.com/shelter.getPets?key=#{API_KEY}&id=NY479&count=100&count=100&format=json")
parsed_data_bideawee = JSON.parse(bideawee)

parsed_data_bideawee["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]

  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end

    photo = pet["media"]["photos"]["photo"].find{ |photo| photo["@size"] == "x" }["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"],photo:photo)
end

#Waggytail Rescue data
waggytail = RestClient.get("http://api.petfinder.com/shelter.getPets?key=#{API_KEY}&id=NY447&count=100&format=json")
parsed_data_waggytail = JSON.parse(waggytail)

parsed_data_waggytail["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
    photo = pet["media"]["photos"]["photo"].find{ |photo| photo["@size"] == "x" }["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"], photo: photo)
end

# Brooklyn Animal Action data
bkanimalaction = RestClient.get("http://api.petfinder.com/shelter.getPets?key=#{API_KEY}&id=NY947&count=100&count=100&format=json")
parsed_data_bkanimalaction = JSON.parse(bkanimalaction)

parsed_data_bkanimalaction["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
    photo = pet["media"]["photos"]["photo"].find { |photo| photo["@size"] == "x" }["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId:pet["shelterId"]["$t"],photo:photo)
end

#GiveMeShelter data
givemeshelter = RestClient.get("http://api.petfinder.com/shelter.getPets?key=#{API_KEY}&id=NY1113&count=100&format=json")
parsed_data_gms = JSON.parse(givemeshelter)

parsed_data_gms["petfinder"]["pets"]["pet"].each do |pet|
  next if !pet["media"]["photos"]
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
    photo = pet["media"]["photos"]["photo"].find{ |photo| photo["@size"] == "x" }["$t"]
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId: pet["shelterId"]["$t"], photo: photo)
end


#NewBeginning Animal Rescue data
  newbeginning = RestClient.get("http://api.petfinder.com/shelter.getPets?key=#{API_KEY}&id=NY1121&count=100&format=json")
  parsed_data_nb = JSON.parse(newbeginning)

  parsed_data_nb["petfinder"]["pets"]["pet"].each do |pet|
    next if !pet["media"]["photos"]
    if pet["breeds"]["breed"][0]
      breed = pet["breeds"]["breed"][0]["$t"]
    else
      breed = pet["breeds"]["breed"]["$t"]
    end
      photo = pet["media"]["photos"]["photo"].find{ |photo| photo["@size"] == "x" }["$t"]
    Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed, shelterId: pet["shelterId"]["$t"], photo:photo)
  end


User.create!(name: "Gabby", username: "gabllini", password: "hellur")
User.create!(name: "Hamilton", username: "hambam", password: "howdy")
User.create!(name: "Athena", username: "theeny", password: "beans")
User.create!(name: "Eva", username: "bedeevies", password: "hi")
