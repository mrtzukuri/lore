require "json"
require "rest-client"

puts 'Creating learning opportunities from eventbrite...'
response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
eventbrite_learning_opportunities = JSON.parse(response)

restaurants_attributes = []

eventbrite_learning_opportunities["drinks"].each do |element|
  LearningOpportunity.create!(
    name: element["strIngredient1"]
    )
end

puts 'Finished!'
