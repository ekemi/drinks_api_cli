class Api

    def self.get_drinks(ingredient)

        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = Net::HTTP.get(URI(url))
        drinks = JSON.parse(response)['drinks']# Allowed us to get an array.
        # Make a drink Object.
        drinks.each do |drink_ob| 
          Drink.new(drink_name: drink_ob["strDrink"],link_picture: drink_ob["strDrinkThumb"],drink_id: drink_ob["idDrink"],ingredient:ingredient)
      end
      
    def self.get_drink_details(drink) 
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        response = Net::HTTP.get(URI(url))
        data_details = JSON.parse(response)["drinks"]
        drink.instructions = data_details[0]["strInstructions"]
        drink.glass = data_details[0]["strGlass"]
        drink.glass = data_details[0]["strGlass"]
        drink.measure = data_details[0]["strMeasure1"]
        drink.category = data_details[0]["strCategory"]
        drink.changed_date = data_details[0]["dateModified"]
     end

end