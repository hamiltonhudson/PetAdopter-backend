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

sfth = RestClient.get('http://api.petfinder.com/shelter.getPets?key=c921a8246aa31a0a166e869b44b40f64&id=NY245&count=100&format=json')
parsed_data_sfth =JSON.parse(sfth)
# puts (parsed_data_rescuzilla["petfinder"]["pets"]["pet"]["name"])

parsed_data_sfth["petfinder"]["pets"]["pet"].each do |pet|
  if pet["breeds"]["breed"][0]
    breed = pet["breeds"]["breed"][0]["$t"]
  else
    breed = pet["breeds"]["breed"]["$t"]
  end
  Pet.create!(name: pet["name"]["$t"], age: pet["age"]["$t"], size: pet["size"]["$t"], sex: pet["sex"]["$t"], description: pet["description"]["$t"], animal: pet["animal"]["$t"], breed: breed)
end


# request = RestClient.get("https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=345&size=200&apikey=#{ENV['API_KEY']}")
# response = JSON.parse(request)
#
# response["_embedded"]["events"].each do |event|
#   Concert.find_or_create_by(artist: event["name"], location: event["_embedded"]["venues"][0]["city"]["name"], venue: event["_embedded"]["venues"][0]["name"], genre: event["classifications"][0]["genre"]["name"], date_and_time: event["dates"]["start"]["dateTime"])
# end
