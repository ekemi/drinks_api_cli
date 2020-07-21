class Api

    def self.get_drinks(ingredient)

        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = Net::HTTP.get(URI(url))
        drinks = JSON.parse(response)['drinks']# Allowed us to get an array.
        # Make a drink Object.
        drinks.each do |drink_ob| 
          Drink.new(drink_name: drink_ob["strDrink"],link_picture: drink_ob["strDrinkThumb"],drink_id: drink_ob["idDrink"],ingredient:ingredient)
      end

end